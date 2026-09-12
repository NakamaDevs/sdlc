"""Exercise the gateway boundary over real loopback HTTP connections."""
import importlib.util
import os
from pathlib import Path
import unittest
from unittest.mock import patch

from aiohttp import web
from aiohttp.test_utils import TestClient, TestServer


class GatewayTests(unittest.IsolatedAsyncioTestCase):
    async def test_same_origin_routes_and_rejects_unrelated_browser_origins(self):
        spec = importlib.util.spec_from_file_location(
            "gateway", Path(__file__).resolve().parents[1] / "gateway/service.py"
        )
        gateway = importlib.util.module_from_spec(spec)
        spec.loader.exec_module(gateway)

        async def echo(request):
            return web.json_response({
                "path": request.path_qs,
                "body": await request.text(),
                "origin": request.headers.get("Origin"),
            })

        upstream = web.Application()
        upstream.router.add_route("*", "/{path:.*}", echo)
        async with TestServer(upstream) as server:
            with patch.dict(os.environ, {"NOTES_URL": str(server.make_url("/"))}):
                async with TestClient(TestServer(gateway.app)) as client:
                    host = f"docs.{gateway.DOMAIN}:8870"
                    response = await client.post("/notes?repo=example", data="note", headers={
                        "Host": host, "Origin": f"http://{host}",
                    })
                    self.assertEqual(response.status, 200)
                    self.assertEqual(await response.json(), {
                        "path": "/notes?repo=example", "body": "note", "origin": None,
                    })
                    for origin in [f"http://docs.{gateway.DOMAIN}:9999", f"https://{host}", "http://outside.example", "null"]:
                        response = await client.post("/notes", headers={"Host": host, "Origin": origin})
                        self.assertEqual(response.status, 403)
                    response = await client.get("/notes", headers={"Host": "outside.example"})
                    self.assertEqual(response.status, 403)


if __name__ == "__main__":
    unittest.main()
