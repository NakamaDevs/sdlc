# MARKDOWN

This guide defines the repository reference archive for external documentation.

## Q: Why keep Markdown snapshots?

A snapshot preserves the source that informed a local decision. It helps reviewers inspect evidence when a site changes, moves, becomes unavailable, or renders differently for different clients.

A snapshot is not the authoritative source. The source URL remains authoritative when it is available. The snapshot records what the project could read on a specific date.

## Q: What belongs in `REFERENCES/`?

Use one subfolder for each subject. Keep the folder names stable and use uppercase Markdown filenames:

- `REFERENCES/AI-MLOPS/`
- `REFERENCES/CI/`
- `REFERENCES/COMMUNICATION/`
- `REFERENCES/MCP/`
- `REFERENCES/OWASP/`
- `REFERENCES/TRANSPORT/`
- `REFERENCES/UNAVAILABLE/`

Keep `REFERENCES/README.md` as the inventory. Each snapshot must record its source URL, title, publisher, retrieval date, conversion tool, conversion version, and known limitations.

## Q: How should a page become a snapshot?

1. Retrieve the page over HTTPS.
2. Record the final URL and retrieval date.
3. Remove scripts, styles, navigation noise, tracking elements, and embedded credentials.
4. Convert the remaining HTML to Markdown with the pinned [Turndown](https://github.com/mixmark-io/turndown) version.
5. Add the source metadata before the converted content.
6. Inspect headings, links, code samples, tables, and warnings.
7. Compare important commands with the current official page.
8. Store the snapshot in the relevant subject folder.
9. Record failures in `REFERENCES/UNAVAILABLE/`.

A conversion must not silently change commands, versions, URLs, requirements, warnings, or normative language. If the converter loses meaning, keep the source as unavailable and record the reason.

## Q: What should the conversion tool do?

Use Turndown for HTML pages. Pin the package version. Configure an explicit heading style and rules for code, tables, links, and images. Remove executable content before conversion.

The converter is a formatting tool. It is not a source validator, security scanner, or citation verifier.

## Q: How should unavailable sources be recorded?

Create an empty Markdown file with the intended uppercase name. Record the URL and retrieval limitation in `REFERENCES/README.md`.

Do not replace an unavailable source with an invented summary. Use a primary alternative when one exists. Recheck placeholders during the next scheduled documentation review.

## Q: How should snapshots stay current?

Review each snapshot at least every 90 days, before relying on a version-specific command, and after a source changes. Update the metadata and inventory in the same change as the snapshot.

Keep the snapshot immutable after publication when it supports a historical decision. Create a new dated snapshot when the source changes materially.

## Q: What must agents do?

Agents must read the inventory before relying on a snapshot. They must prefer the current official source for commands and security requirements. They must state when a claim comes from a snapshot, a live source, or a local test.

Agents must not treat archived text as permission to bypass current security, licensing, privacy, or deployment requirements.

## References

- [Turndown repository](https://github.com/mixmark-io/turndown)
- [Turndown README](https://github.com/mixmark-io/turndown#readme)
- [MCP authorization specification](https://modelcontextprotocol.io/specification/2025-06-18/basic/authorization)
- [OWASP Web Security Testing Guide](https://owasp.org/www-project-web-security-testing-guide/latest/4-Web_Application_Security_Testing/00-Introduction_and_Objectives/)