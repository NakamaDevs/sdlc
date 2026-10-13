# REMOTE-ACCESS

Remote access is an optional team profile. Keep the same task and evidence contract when the VPN or terminal changes.
Use [HERDR.md](HERDR.md) for persistent sessions and [COMPOSITION.md](COMPOSITION.md) for adapter selection.

## Access model

Separate the phone or laptop, private network identity, remote OS account, terminal session, and application credentials.
Permission to SSH does not grant production access or authority over every agent pane.
Use a dedicated development account without routine administrator privileges. Keep production credentials out of that account by default.
Bind dashboards and development control endpoints to loopback. Reach them through an approved tunnel or authenticated private gateway.

## Tailscale profile

Enroll only approved users and devices. Require the organization's identity controls and device approval process.
Define narrowly scoped grants from allowed source identities or devices to tagged development hosts and required ports.
Remove conflicting broad allow rules after testing the replacement. Access grants are additive; a narrow grant does not cancel a broad one.
Use device posture requirements where supported. Keep tag ownership restricted to the administrators who assign machine roles.

Choose either ordinary OpenSSH over the private network or Tailscale SSH on supported hosts.
For Tailscale SSH, configure both network reachability and SSH authorization. Use check mode where interactive reauthorization is appropriate.
Limit destination OS users. Keep development and production host tags separate.
Review expiry, recovery, lost-device revocation, and the effect of service-account or tagged-node ownership.

Test policy before rollout. Use the provider's policy tests and actual allowed and denied clients.
Retain a verified recovery path before changing access. This handbook does not apply a tailnet policy to a live account.

## Access acceptance matrix

| Source and action | Expected result |
| --- | --- |
| Approved workstation to development SSH | Allowed for the designated OS user |
| Approved phone to its assigned development host | Allowed after required authentication |
| Unapproved device to development host | Denied |
| Development host to production administration | Denied unless separately authorized |
| Any public internet client to local dashboard | Denied |
| Revoked or expired device attempting reconnect | Denied |
| Authorized terminal user targeting another person's pane | Requires that task's explicit authority |

Network policy alone cannot distinguish a safe command from a destructive command inside an allowed shell.
Use OS users, filesystem permissions, credential scope, sandboxing, and task authorization for workflow separation.
Test outbound access separately. A private inbound network is not an egress sandbox.

## Mobile and terminal workflow

Moshi is one optional SSH or Mosh client. A different approved mobile terminal can use the same host and task contract.
Establish the private network on the phone first. Verify the remote host identity and connect with the approved OS account.
Use key-based authentication or the selected SSH identity mechanism. Keep host-key verification enabled.

On the remote machine, inspect the exact named Herdr session, workspace, and pane before sending input.
Confirm the pane is an idle shell before executing a shell command. Never infer a target from screen position.
Use the installed Herdr help and approved skill for commands. The template does not assume session names or socket locations.
Disconnect and reconnect once to prove the session and job survive. Record output and artifacts on the remote host.

Test SSH first. Mosh needs an additional UDP policy and server support; approve only the required range for the selected host.
Notifications and mobile agent hooks may use external services outside the VPN. Review payloads and consent separately.
A suspended host still stops work. Choose host sleep and availability settings deliberately.

## Other networks and hosts

For a corporate VPN, WireGuard, bastion, or bare-metal host, implement the same identity and denial tests.
Document supported platforms, account recovery, key rotation, logs, session ownership, and cleanup.
Use infrastructure-as-code or a reviewed policy artifact when available. Record current and proposed access before applying changes.
Cloud choice does not change the evidence required for least-privilege remote development.

## References

- [Tailscale grants](https://tailscale.com/docs/reference/syntax/grants)
- [Tailscale SSH](https://tailscale.com/docs/features/tailscale-ssh)
- [Moshi connection and authentication guide](https://getmoshi.app/docs/connections)
- [Moshi and Herdr](https://getmoshi.app/docs/herdr)
