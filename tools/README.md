# Local SDLC workspace

This workspace runs the documentation and review tools beside the repository.
Python services run natively under the TypeScript Aspire host. One notes service owns the DuckDB file.

## Start

Install Node.js 24, Python 3.12, uv, and mise. The setup task installs the pinned Aspire CLI.
Run these commands from the repository root:

```sh
mise run workspace:setup
mise run workspace:start
npx aspire wait gateway --non-interactive
```

Open <http://docs.sdlc.localhost:8870/> or <http://review.sdlc.localhost:8870/>.
The gateway binds to loopback. No Docker containers are required.

```sh
mise run workspace:stop
```

## Configure roots

Edit `workspace.json`. Repository paths are relative to that file. Each documentation entry selects a repository and a folder.
The entry ID becomes its URL prefix. For example, `en` becomes `/en/`.
Keep IDs stable so saved annotation links remain valid.

The default configuration serves `en`, `es`, and the shared `references` archive.
Add another repository to `repositories` to show it in the review selector.
Add documentation entries to serve other folders or languages.
Set `SDLC_WORKSPACE_CONFIG` to use a different configuration file.

Use `SDLC_PORT` and `SDLC_DOMAIN` for a concurrent checkout. The domain must end with `.localhost`.
Each checkout stores its own notes under `_build/state/notes.duckdb`.
Do not share that writable file between running hosts.

## Read, annotate, and edit

- Use Command/Ctrl+K for search.
- Use Command/Ctrl+P to select a page or section. Type `>` for actions.
- Use Command/Ctrl+J to switch the theme.
- Select text or click a block's gutter marker to add a note.
- Choose **Edit file** in the note composer to open its Markdown source.
- Use the review editor to save changes in the working tree.
- Review the diff before using the separate commit action. Nothing is pushed automatically.

The docs service copies configured roots to `_build/docs/source` and watches their changes.
Maintained Markdown files remain the source of truth.
The palette records each page's repository and source path for editor navigation.
A note records its page, heading, text preview, and block hash. Changes to other blocks do not move it.
If its block changes, the note remains available in the comments panel for review.
Both tools read and write notes through HTTP. Only the notes process opens DuckDB.

## Use Tidewave

The review dev server runs the Tidewave Vite plugin. The gateway forwards `/tidewave` from both hosts to that server.

- Agents connect to `http://review.sdlc.localhost:8870/tidewave/mcp`. The committed `.mcp.json` registers this URL.
- Both sites load the Tidewave toolbar from `https://tidewave.ai`. Tidewave Web requires a Tidewave account.
- On docs pages, browser tools inspect the docs page. Server tools such as `project_eval` and `get_logs` run in the review dev server.
- `project_eval` runs code in that process. Treat it as a privileged capability.
- Screenshots and recordings go to `_build/tidewave`. Uploads through the gateway are limited to 8 MB.
- For a concurrent checkout, override the MCP URL with your `SDLC_DOMAIN` and `SDLC_PORT` values in a local MCP configuration.

Static builds from `mise run docs:build` do not load the toolbar.

## Verify

```sh
mise run workspace:check
mise run docs:build
mise run verify
```

Python is the current service implementation. A future Elixir implementation can preserve the HTTP contracts and browser components.
