# herdr

Optional Q&A for persistent local-first and remote-first agent work.

## Q: What problem does Herdr solve?

Herdr keeps agent work running in a persistent workspace. This helps when a laptop sleeps, a lid closes, a terminal closes, a person changes context, or a long test continues after the human leaves.

Use it to preserve visible command output, long-running development servers, test runs, browser sessions, and agent workspaces. Keep the work inspectable and recoverable.

## Q: What is the local-first workflow?

Start work in the local Herdr workspace when the local machine has the required tools, data, credentials, and network access. Keep the repository checkout and artifacts local. Use labeled tabs or panes for the agent, server, tests, and logs.

Use bounded output reads. Keep the pane open for human inspection. Record a success or failure marker and the artifact path.

## Q: What is the remote-first workflow?

Use a remote Herdr instance when the work needs persistent availability, stronger hardware, a stable network, or separation from the laptop. Use an isolated workspace, least-privilege credentials, approved network access, and explicit cleanup.

Connect from the laptop as a viewer or controller. The work should continue when the laptop disconnects. Do not copy secrets into pane commands or chat.

## Q: How should an agent use Herdr?

Use the repository-approved Herdr skill and version. Read the skill instructions before operating panes or neighboring agents. Reuse labeled tabs. Run long commands in a visible pane. Wait for a literal success or failure marker. Read bounded recent output.

Verify commands against the pinned skill and herdr help. Do not guess pane names, socket paths, flags, or workspace identifiers.

## Q: How do we keep this non-blocking for humans?

Make every long task resumable. Record the command, working directory, environment, owner, start time, status marker, artifact path, and cleanup action. A human can leave for a meal and return to the result.

Use notifications only for completion, failure, approval, or a material decision. Keep routine progress in the pane or artifact.

## Q: What are the safety rules?

Use isolated workspaces. Do not share a branch between editing agents. Do not expose the Herdr control plane publicly. Protect sockets and credentials. Stop remote resources and remove temporary data after the task.

## References

- [Herdr](https://herdr.dev/)
- [Herdr agent guide](https://herdr.dev/agent-guide.md)
- [Herdr skill v0.8.2](https://github.com/herdrdev/herdr/blob/v0.8.2/skills/herdr/SKILL.md)
