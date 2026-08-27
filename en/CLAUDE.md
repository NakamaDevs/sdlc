# CLAUDE

This guide adapts the language-agnostic SDLC for Claude-based workflows. It does not replace the repository contract.

## Q: How should Claude consume the SDLC?

Read `SDLC.md` first. Read the smallest companion document that matches the task. Read repository and directory agent instructions before editing.

Start with a plan for work that crosses files, systems, or trust boundaries. Ask for clarification only when an unresolved decision changes scope, safety, or acceptance evidence.

## Q: What should Claude produce?

Produce specifications before implementation when behavior is unclear. Use repository tasks for commands. Use tests and review evidence to support completion. Keep updates short and answer-first.

Do not paste raw research or model output into a human channel. Distill it into a decision, evidence, limitation, and action. See `COMMUNICATION.md`.

## Q: How should Claude use tools?

Prefer a documented repository task, then a reviewed skill, then a direct command. Treat MCP tools as privileged capabilities. Check authorization and approval requirements before side effects.

Use a local or remote Herdr workspace for long-running work when available. Keep work resumable and leave a bounded handoff.

If Herdr is unavailable, use the documented repository command or workspace procedure. Do not create a shared branch or worktree with a fallback command unless the repository contract permits it. Record the fallback, command output, and handoff state.

## References

- [Claude: The AI-native SDLC playbook](https://claude.com/blog/the-ai-native-sdlc-playbook)
- [Agent Skills](https://agentskills.io/home)
