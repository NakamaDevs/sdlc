# CODEX

This guide adapts the language-agnostic SDLC for Codex-based workflows. It does not replace `AGENTS.md` or the repository contract.

Use [AGENT-TEAM.md](AGENT-TEAM.md) for the composable team workflow and acceptance exercises.

## Q: How should Codex consume the SDLC?

Read `AGENTS.md`, then `SDLC.md`, then the smallest relevant companion guide. Follow the instruction chain and repository quality gates.

Use the plan tool for substantial work. Use read-only inspection before edits. Follow the repository branch policy. Create the required issue, branch, and Herdr worktree before edits when that policy requires them. Use trunk-based changes only when the policy permits them.

## Q: What should Codex report?

Report the answer first. Include evidence, limitations, current status, owner, and next action. Keep command output bounded. Do not claim a command or reference works without verifying the version and result.

Use Linear or the repository's equivalent tracker when configured. Update the issue after meaningful progress and at milestone completion.

## Q: How should Codex handle review comments?

Use [CODE-REVIEW.md](CODE-REVIEW.md) for accuracy checks, response fields, status changes, evidence, and thread resolution.

Verify each finding before changing code. Fix valid findings and add regression evidence.

Reject invalid findings only with exact evidence.

Resolve a thread after its final result is pushed and reported.

Request another review after all threads reach a final state.

## Q: How should Codex use MCP and local tools?

Use a repository task or skill when one exists. Use MCP for reusable capabilities and APIs. Use Code Mode only with an isolated sandbox, bounded output, and explicit approval for side effects.

Keep secrets in the host boundary. Do not expose credentials to prompts, generated code, or tool results.

## References

- [Building an AI-Native Engineering Team](https://learn.chatgpt.com/guides/build-ai-native-engineering-team)
- [Codex best practices](https://cdn.openai.com/pdf/6a2631dc-783e-479b-b1a4-af0cfbd38630/how-openai-uses-codex.pdf)
- [AGENTS.md convention](https://learn.chatgpt.com/docs/agent-configuration/agents-md)
