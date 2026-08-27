# CODEX

This guide adapts the language-agnostic SDLC for Codex-based workflows. It does not replace `AGENTS.md` or the repository contract.

## Q: How should Codex consume the SDLC?

Read `AGENTS.md`, then `SDLC.md`, then the smallest relevant companion guide. Follow the instruction chain and repository quality gates.

Use the plan tool for substantial work. Use read-only inspection before edits. Prefer trunk-based changes unless dependencies, review isolation, or Kaicho policy require a branch or worktree.

## Q: What should Codex report?

Report the answer first. Include evidence, limitations, current status, owner, and next action. Keep command output bounded. Do not claim a command or reference works without verifying the version and result.

Use Linear or the repository's equivalent tracker when configured. Update the issue after meaningful progress and at milestone completion.

## Q: How should Codex use MCP and local tools?

Use a repository task or skill when one exists. Use MCP for reusable capabilities and APIs. Use Code Mode only with an isolated sandbox, bounded output, and explicit approval for side effects.

Keep secrets in the host boundary. Do not expose credentials to prompts, generated code, or tool results.

## Reference

- [Building an AI-Native Engineering Team](https://learn.chatgpt.com/guides/build-ai-native-engineering-team)
- [Codex best practices](https://cdn.openai.com/pdf/6a2631dc-783e-479b-b1a4-af0cfbd38630/how-openai-uses-codex.pdf)
- [AGENTS.md convention](https://learn.chatgpt.com/docs/agent-configuration/agents-md)