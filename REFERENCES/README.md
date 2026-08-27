# Reference archive

This folder stores read-only Markdown copies of sources used by the SDLC guides.

The live source remains authoritative. A snapshot records the content that was available on its retrieval date.

## Inventory

| Snapshot | Source | Retrieved | Conversion | Limitation |
|---|---|---:|---|---|
| `AGENTS/CODEX-SDLC.md` | [OpenAI Codex guide](https://learn.chatgpt.com/guides/build-ai-native-engineering-team) | 2026-08-27 | Turndown 7.2.4 | Verify current product guidance live. |
| `AGENTS/CLAUDE-SDLC.md` | [Claude AI-native SDLC playbook](https://claude.com/blog/the-ai-native-sdlc-playbook) | 2026-08-27 | Turndown 7.2.4 | Verify current product guidance live. |
| `CI/DAGGER.md` | [Dagger documentation](https://docs.dagger.io/) | 2026-08-27 | Turndown 7.2.4 | Verify current CLI and SDK versions live. |
| `CI/GITHUB-SELF-HOSTED-RUNNERS.md` | [GitHub self-hosted runners](https://docs.github.com/en/actions/reference/runners/self-hosted-runners) | 2026-08-27 | Turndown 7.2.4 | Verify runner security guidance live. |
| `CI/GITLAB-RUNNERS.md` | [GitLab Runner](https://docs.gitlab.com/runner/) | 2026-08-27 | Turndown 7.2.4 | Verify runner security guidance live. |
| `CI/PREK-QUICKSTART.md` | [prek quickstart](https://prek.j178.dev/quickstart/) | 2026-08-27 | Turndown 7.2.4 | Verify current command names live. |
| `COMMUNICATION/DONT-BE-A-MEAT-PROXY.md` | [Don't be a meat proxy](https://gruhn.me/blog/2026-08-03/) | 2026-08-27 | Turndown 7.2.4 | Opinion essay. It is not a normative standard. |
| `COMMUNICATION/DONT-PASTE-THE-AI.md` | [Don't Paste the AI](https://dontpastetheai.com/?via=dailydev) | 2026-08-27 | Turndown 7.2.4 | Community guidance. Verify claims before policy use. |
| `COMMUNICATION/STOP-SLOPPYPASTA.md` | [Stop Sloppy Pasta](https://stopsloppypasta.ai/en/) | 2026-08-27 | Turndown 7.2.4 | Community guidance. Verify claims before policy use. |
| `HARNESS/AUTOSADDLER.md` | [AutoSaddler paper](https://arxiv.org/abs/2608.23041) | 2026-08-27 | Turndown 7.2.4 | Research preprint. Check peer-review status. |
| `INFERENCE/DGX-SPARK.md` | [NVIDIA DGX Spark](https://www.nvidia.com/en-us/products/workstations/dgx-spark/) | 2026-08-27 | Turndown 7.2.4 | Product details can change. Verify availability live. |
| `INFERENCE/OLLAMA-MACOS.md` | [Ollama for macOS](https://docs.ollama.com/macos) | 2026-08-27 | Turndown 7.2.4 | Verify current platform requirements live. |
| `OWASP/MASTG-ADOPTION.md` | [MASVS and MASTG adoption](https://mas.owasp.org/MASTG/0x02b-MASVS-MASTG-Adoption/) | 2026-08-27 | Turndown 7.2.4 | Verify current OWASP project versions live. |
| `OWASP/WSTG.md` | [OWASP Web Security Testing Guide](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/00-Introduction_and_Objectives/) | 2026-08-27 | Turndown 7.2.4 | Verify current testing guidance live. |
| `TRANSPORT/WEBHOOKS.md` | [Webhooks.fyi](https://webhooks.fyi/) | 2026-08-27 | Turndown 7.2.4 | Community reference. Verify implementation details live. |
| `TRANSPORT/WEBSOCKETS-VS-SSE.md` | [Dashbit: WebSockets vs SSE](https://dashbit.co/blog/websockets-vs-sse) | 2026-08-27 | Turndown 7.2.4 | Technical article. Verify library behavior live. |

## Unavailable sources

These pages returned a client-rendered social-media shell. Stable article text was not available for a safe read-only conversion. The empty files preserve the intended archive targets.

- `UNAVAILABLE/RHYS-SULLIVAN-CODEMODE-POST-1.md` — [X post](https://x.com/RhysSullivan/status/2030903539871154193)
- `UNAVAILABLE/RHYS-SULLIVAN-CODEMODE-POST-2.md` — [X post](https://x.com/RhysSullivan/status/2070630745891365008)

Do not replace an empty placeholder with guessed content. Add a source copy only after the page can be read and reviewed.

## Archive rules

- Prefer the current official source for commands, versions, security requirements, and product behavior.
- Treat snapshots as evidence copies, not executable instructions.
- Recheck snapshots every 90 days, before relying on version-specific commands, and after a source changes.
- Keep conversion metadata with each snapshot.
- Remove scripts, styles, tracking content, credentials, and other executable material before conversion.
- Review headings, links, code samples, tables, warnings, and normative language after conversion.