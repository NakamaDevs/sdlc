# SOURCE SNAPSHOT\n\n- Source URL: https://docs.dagger.io/\n- Title: Dagger documentation\n- Retrieved: 2026-08-27\n- Conversion: Turndown 7.2.4\n- Status: archival copy; verify the live source for current facts.\n\n---\n\n[Skip to main content](#__docusaurus_skipToContent_fallback)

[

![Dagger Logo](/img/dagger-logo-black.png)![Dagger Logo](/img/dagger-logo-white.png)

](https://dagger.io/)

1.0-beta0.210.200.190.180.170.16Next

[1.0-beta](/getting-started/introduction)

*   [Next](/next/getting-started/introduction)
*   [1.0-beta](/getting-started/introduction)
*   [0.21](/0.21/)
*   [0.20](/0.20/)
*   [0.19](/0.19/)
*   [0.18](/0.18/)
*   [0.17](/0.17/)
*   [0.16](/0.16/)

[Try Dagger Cloud](https://dagger.io/cloud)

SearchCtrl K

[![Dagger Logo](/img/dagger-logo-black.png)![Dagger Logo](/img/dagger-logo-white.png)](https://dagger.io/)1.0-beta0.210.200.190.180.170.16Next

SearchCtrl K

*   [Getting Started](/getting-started/introduction)
    
    *   [Introduction](/getting-started/introduction)
    *   [Quickstart](/getting-started/quickstart)
    *   [Workspace setup](/getting-started/workspace-setup)
    *   [Pre-push workflow](/getting-started/pre-push)
    *   [Post-push workflow](/getting-started/post-push)
*   [CLI](/cli/install)
    
    *   [Installation](/cli/install)
    *   [Checking your code](/cli/checking)
    *   [Generating code](/cli/generating)
    *   [Running services](/cli/services)
    *   [Calling functions](/cli/calling-functions)
    *   [Reference](/cli/reference)
*   [Configuration](/config)
    
*   [Modules](/modules)
    
*   [SDKs](/sdks)
    
*   [API](/api)
    

Version: 1.0-beta

On this page

# Introduction

Dagger is the missing software stack for CI. It makes your pipelines faster and more repeatable, not by throwing bigger machines at them, but by replacing artisanal scripts with a clean API, real code, and a portable DAG execution engine.

Once daggerized, your pipeline logic is decoupled from its environment. Trigger it before or after push; run it locally or let our cloud scale it out; spin up multi-container environments just in time; all cached automatically, traced end to end, and extensible in your favorite language.

## Orientation[​](#orientation "Direct link to Orientation")

*   **Want to adopt Dagger in your project?** Start with the [Quickstart](/getting-started/quickstart), then follow [Workspace setup](/getting-started/workspace-setup).
*   **Your project already uses Dagger?** See [CLI](/cli/checking) to run checks, generate code, and start services.
*   **Want to learn more about what Dagger can do?** Keep reading.

## What you can do[​](#what-you-can-do "Direct link to What you can do")

No code required. Install modules, run commands, get results.

### Lint and format across your stack[​](#lint-and-format-across-your-stack "Direct link to Lint and format across your stack")

```
dagger install github.com/dagger/eslintdagger install github.com/dagger/prettierdagger check
```

### Run e2e tests with real services[​](#run-e2e-tests-with-real-services "Direct link to Run e2e tests with real services")

```
dagger install github.com/dagger/playwrightdagger check
```

### Run code generators[​](#run-code-generators "Direct link to Run code generators")

```
dagger install github.com/dagger/godagger generate
```

### Debug a broken build[​](#debug-a-broken-build "Direct link to Debug a broken build")

```
dagger checkdagger api call eslint lint terminal
```

## Key features[​](#key-features "Direct link to Key features")

**Programmable.** Real code — Go, Python, TypeScript — not YAML.

**Local-first.** Run your full pipeline before you push. Same result everywhere.

**Zero-setup tracing.** Every step traced automatically. No instrumentation code.

**Interactive debugging.** Drop into a terminal at any step of your pipeline.

**Incremental execution.** Only what changed gets re-executed.

**Agent-friendly.** Agents run Dagger checks in their dev loop. Sandboxed, cached, remote.

**Native secrets.** Plugs into your existing secret infrastructure.

**Just-in-time services.** Service dependencies build on demand, no pre-provisioning.

[Edit this page](https://github.com/dagger/dagger/edit/main/docs/versioned_docs/version-1.0-beta/getting-started/introduction.mdx)

[

Next

Quickstart

](/getting-started/quickstart)

[Try Dagger Cloud](https://dagger.io/cloud)

*   [Orientation](#orientation)
*   [What you can do](#what-you-can-do)
    *   [Lint and format across your stack](#lint-and-format-across-your-stack)
    *   [Run e2e tests with real services](#run-e2e-tests-with-real-services)
    *   [Run code generators](#run-code-generators)
    *   [Debug a broken build](#debug-a-broken-build)
*   [Key features](#key-features)

* * *

© Dagger 2022-2025

[](https://discord.gg/dagger-io)[](https://twitter.com/dagger_io)