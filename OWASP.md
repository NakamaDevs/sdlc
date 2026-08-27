# OWASP

Optional Q&A and pre-launch security checklist for humans and agents.

This guide uses OWASP MASVS, the Mobile Application Security Verification Standard, as the assumed meaning of “MAVST”. Confirm the applicable standard for each platform and risk profile.

## Q: What is the security baseline?

Use threat modeling, OWASP ASVS for web applications and services, OWASP API Security Top 10 for APIs, and MASVS with MASTG for mobile applications. Map each applicable control to an owner, implementation, test, evidence path, and exception.

Do not claim certification from a checklist. Record the selected version, scope, exclusions, test methods, findings, residual risk, and approval.

## Q: What must never be public?

Never publish passwords, private keys, signing keys, access tokens, refresh tokens, database credentials, cloud credentials, CI secrets, private certificates, recovery codes, production exports, personal data, candidate data, or unredacted security reports.

Check source files, Git history, branches, tags, issues, pull requests, comments, releases, packages, container layers, build artifacts, crash reports, screenshots, test snapshots, logs, and documentation examples.

A secret in an encrypted SOPS file can still leak through keys, decrypted artifacts, logs, backups, CI output, or a compromised identity. Encryption at rest does not make a secret safe to publish without a key and lifecycle review.

## Q: Where should secrets live?

Use a managed secret store or KMS for deployed services. Use workload identity, short-lived credentials, and least privilege when the platform supports them. Keep development secrets in an approved local secret store or injected environment, not in tracked files.

Use the operating-system keychain or keystore for installed-app credentials and key material. Use encrypted application storage for larger sensitive data, with the encryption key protected by the platform keystore. Treat a device backup, debug build, rooted device, jailbroken device, and process memory as possible exposure paths.

Do not store secrets in iOS `UserDefaults`, Android shared preferences, plain files, logs, clipboard data, notifications, browser storage, or application bundles. `UserDefaults` is for non-sensitive preferences.

For browser applications, prefer server-managed sessions in `HttpOnly`, `Secure`, and appropriate `SameSite` cookies, or a Backend-for-Frontend pattern. Do not store authentication tokens, session identifiers, JWTs, refresh tokens, or credentials in `localStorage` or `sessionStorage`.

No secret embedded in a browser bundle, mobile application, desktop binary, or WASM module is a secret. A client is an untrusted environment. Put authorization and valuable secrets on a server.

## Q: What should we encrypt?

First minimize collection and retention. Classify data by confidentiality, integrity, availability, privacy, and regulatory impact. Encrypt data in transit with validated TLS. Encrypt sensitive data at rest when storage, backup, host, or operator access could expose it.

Use application-level encryption when storage or infrastructure operators must not read the data, when data crosses trust boundaries, or when field-level separation is required. Define key ownership, rotation, revocation, recovery, access, destruction, and audit before implementation.

Use standard, reviewed cryptographic libraries. Do not invent algorithms, reuse nonces, hard-code keys, use passwords as keys without a reviewed derivation function, or place encryption keys beside ciphertext without a separate protection boundary.

## Q: How should SOPS fit?

SOPS is suitable for encrypting configuration values in version control when the repository, key groups, identities, and decryption boundary are controlled. Keep `.sops.yaml` reviewed. Use age or the approved cloud KMS identity. Decrypt only at the trusted execution boundary.

Scan before commit and after decryption. Ensure plaintext does not enter logs, shell history, process arguments, artifacts, caches, or container layers. Rotate and revoke keys after exposure. Keep production, staging, development, and recovery identities separate.

## Q: When should we use attestation?

Use attestation when the server needs additional evidence about an app, device, key, or browser authenticator before a high-risk action. Use it as one input to risk analysis, not as a replacement for authentication, authorization, secure transport, rate limits, or fraud controls.

For Apple platforms, App Attest uses a device-generated key, a server challenge, an attestation object, and later assertions. The server must verify the attestation, bind the public key to the intended app, prevent replay, track assertion counters, and keep development and production environments separate.

For Android, evaluate Play Integrity and Android Key Attestation according to the threat model and distribution channel. Verify tokens on the server. Define nonce binding, replay protection, verdict handling, privacy, availability fallback, and the response to unsupported devices.

For browsers, use WebAuthn or passkeys when user authentication and phishing resistance are required. Validate the challenge, origin, relying party, signature, credential state, and user-verification policy on the server.

Do not block every user when an attestation service is unavailable. Select fail-open or fail-closed behavior by action risk. Record the decision and test degraded operation.

## Q: What is the pre-launch checklist?

### Scope and threat model

- Define assets, actors, trust boundaries, abuse cases, data flows, and high-impact actions.
- Identify public endpoints, admin paths, internal services, third-party providers, and offline behavior.
- Record assumptions, out-of-scope items, and residual risk owners.

### Source, dependencies, and supply chain

- Scan the working tree, history, artifacts, and container images for secrets.
- Pin dependencies, compilers, actions, images, scanners, and rule sets.
- Review licenses, provenance, signatures or checksums, install scripts, and transitive dependencies.
- Run SAST, SCA, image, IaC, and workflow checks with recoverable reports.

### Identity and authorization

- Test authentication, session lifecycle, logout, token rotation, expiry, replay, and recovery.
- Test authorization for every object, tenant, role, action, and administrative path.
- Test rate limits, lockout behavior, abuse controls, and audit events.

### Input, API, and browser

- Validate input at every trust boundary.
- Test injection, deserialization, path traversal, SSRF, request smuggling, CORS, CSRF, and unsafe redirects.
- Test security headers, cookie attributes, content security policy, cache behavior, and error disclosure.
- Test API object-level authorization and sensitive data exposure.

### Mobile and installed applications

- Apply relevant MASVS storage, cryptography, authentication, network, platform, code, resilience, and privacy controls.
- Check logs, backups, screenshots, notifications, clipboard, WebViews, deep links, IPC, exported components, debug flags, and release symbols.
- Check Keychain or Keystore access, key invalidation, device lock behavior, and biometric step-up controls.
- Test attestation and degraded service behavior on supported and unsupported devices.

### Operations and release

- Verify TLS, certificate validation, secret injection, network policy, least privilege, backups, and deletion.
- Verify redaction in logs, traces, metrics, screenshots, and support exports.
- Verify alerts, incident contacts, key rotation, revocation, rollback, and recovery.
- Run a production-like smoke test without production personal data.

## Q: Which local tools should agents run?

Use the repository-approved tools and versions. A practical local lane can include Gitleaks for secrets, Semgrep for SAST, Trivy for dependencies, images, misconfigurations, secrets, and SBOMs, zizmor for GitHub Actions, OWASP Dependency-Check for additional SCA, and OWASP ZAP for approved DAST targets.

Run tools locally or in a controlled self-hosted runner when source or logs are sensitive. Review network access and update behavior. Keep findings and raw evidence private. Do not upload source or secrets to an external scanner without approval.

## Q: What evidence must remain?

Keep the selected standard and version, threat model, control matrix, tool versions, rule or database versions, target commit, environment, exclusions, findings, remediations, accepted risks, retest results, and approval record.

A clean scanner result is not proof that the system is secure. Security is a risk decision supported by multiple tests and human review.

## References

- [OWASP MASVS](https://mas.owasp.org/MASVS/)
- [OWASP MASTG](https://mas.owasp.org/MASTG/)
- [OWASP ASVS](https://owasp.org/www-project-application-security-verification-standard/)
- [OWASP API Security Top 10](https://owasp.org/API-Security/)
- [OWASP Top 10](https://owasp.org/www-project-top-ten/)
- [OWASP Secrets Management Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Secrets_Management_Cheat_Sheet.html)
- [OWASP Key Management Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Key_Management_Cheat_Sheet.html)
- [OWASP Threat Modeling Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Threat_Modeling_Cheat_Sheet.html)
- [OWASP Session Management Cheat Sheet](https://cheatsheetseries.owasp.org/cheatsheets/Session_Management_Cheat_Sheet.html)
- [Apple App Attest validation](https://developer.apple.com/documentation/devicecheck/validating-apps-that-connect-to-your-server)
- [Android Play Integrity API](https://developer.android.com/google/play/integrity)
- [WebAuthn API](https://developer.mozilla.org/en-US/docs/Web/API/Web_Authentication_API)
- [OWASP ZAP](https://www.zaproxy.org/)
- [OWASP MASTG adoption](https://mas.owasp.org/MASTG/0x02b-MASVS-MASTG-Adoption/)
