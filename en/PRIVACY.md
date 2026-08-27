# PRIVACY

This guide defines privacy controls for software delivery records. It does not replace legal, contractual, employment, or clinical requirements.

## Q: Which data must stay out of delivery records?

Personally identifiable information (PII) identifies a person or can link data to a person. Protected health information (PHI) is identifiable health information covered by an applicable health-privacy rule.

Treat uncertain data as restricted until the responsible privacy owner classifies it.

Do not put real PII or PHI in:

- prompts, agent context, skills, or model-evaluation inputs;
- branch names, commit messages, tags, issues, pull requests, or reviews;
- source examples, fixtures, snapshots, demos, or generated documentation;
- logs, traces, metrics, crash reports, screenshots, recordings, or terminals;
- changelogs, release notes, packages, artifacts, public Gists, or caches.

This rule covers names, personal email addresses, phone numbers, home addresses, government identifiers, account identifiers, exact personal dates, images, voice, biometrics, health conditions, care, payments, medical records, appointments, and prescriptions.

Public availability does not make reuse safe or authorized. Keep secrets under the separate controls in [SECURITY.md](SECURITY.md).

## Q: Which data can examples and tests use?

Use generated synthetic data that does not come from a real person. Use reserved domains such as `example.com` and `example.test`. Use role labels such as `Person A` and opaque records such as `record-001`.

Do not copy production, support, candidate, employment, customer, patient, or payment data into development.

Replacing a name does not prove de-identification. Dates, locations, images, voice, identifiers, free text, and linked datasets can identify a person in combination.

An authorized privacy process must approve de-identification. Health data under HIPAA uses an applicable HHS method, such as Expert Determination or Safe Harbor. Do not claim compliance from a local scanner.

## Q: What is the minimum-data workflow?

Before processing restricted data, record:

- the approved purpose and minimum fields;
- the data owner and privacy owner;
- the legal, contractual, or consent basis;
- the approved systems, providers, regions, and recipients;
- access controls, encryption, retention, deletion, and audit requirements;
- the incident contact and stop condition.

Give an agent only the smallest redacted context that completes the approved task.

Do not send restricted data to an external model, tool, connector, or service without explicit approval for that provider and data class.

## Q: What should automation check?

Scan maintained source, staged changes, generated output, public exports, logs, and artifacts.

A repeatable check can find structured identifiers and known prohibited values. It must report only the file, line, and category. It must not repeat the discovered value.

Keep allowlists narrow, explained, tested, and reviewed. A person must also review free text, images, audio, and cross-field combinations.

A passing scanner is supporting evidence. It does not prove that content has no PII or PHI.

## Q: What should happen after an exposure?

1. Stop publication and further processing.
2. Restrict access to the affected record and copies.
3. Notify the privacy owner and security owner.
4. Preserve a redacted incident record and affected reference.
5. Assess recipients, caches, forks, backups, and legal duties.
6. Remove current content and rotate any related credential.
7. Rewrite published history only with explicit authorization.
8. Verify every target ref and record remaining limits.

Deleting the latest revision does not prove removal from history, clones, caches, mirrors, logs, or backups.

For a public Gist, verify all revisions after an authorized history rewrite. Delete and recreate it only when the owner accepts the URL change and remaining cache risk.

## Q: Which evidence should the project keep?

Keep the classification, purpose, owner, approved environment, provider, region, recipients, retention date, deletion result, access review, redaction result, and incident reference.

Do not repeat raw PII or PHI in the evidence record. Use a stable redacted identifier or digest when correlation is necessary.

Review privacy controls before release and whenever data fields, processors, model providers, telemetry, retention, or access paths change.

## References

- [NIST Privacy Framework](https://www.nist.gov/privacy-framework)
- [NIST Privacy Framework use guidance](https://www.nist.gov/privacy-framework/using-privacy-framework-11)
- [HHS guidance for de-identification of protected health information](https://www.hhs.gov/hipaa/for-professionals/special-topics/de-identification/index.html)
- [FTC Start with Security guide](https://www.ftc.gov/business-guidance/resources/start-security-guide-business)
- [SECURITY.md](SECURITY.md)
- [OWASP.md](OWASP.md)
- [NOTES.md](NOTES.md)
