# WEB CAPTURE

This guide defines the local Elixir reader and HTML-to-Markdown capture tool.

## Q: Why does this repository include a local reader?

The earlier archive used Turndown after another tool selected page content.

Turndown converts HTML nodes well, but it does not select the main article. It also does not render client-side applications.

The local reader keeps conversion, extraction, image handling, validation, and evidence metadata in one removable library.

The code lives under `lib/sdlc/reader/`. Tests and fixtures live under `test/`.

## Q: What does the reader pipeline do?

The pipeline has these stages:

1. validate and fetch a public HTTP target;
2. optionally render the page with a verified Chrome executable;
3. select the main readable content;
4. remove navigation, ads, promotions, forms, and hidden page chrome;
5. convert the selected DOM to CommonMark and GitHub Flavored Markdown;
6. preserve direct image links or create approved local image copies;
7. detect unsafe or malformed Markdown patterns;
8. write source metadata without claiming a human review;
9. require human review before recording the body hash.

Each stage has a separate module and focused tests.

## Q: How does the Markdown converter work?

The converter uses a Turndown-style rule pipeline in Elixir.

It processes child nodes before their parent. Ordered custom rules take precedence over built-in rules.

It supports headings, paragraphs, emphasis, links, images, lists, blockquotes, code, fenced code, and GFM tables.

It escapes Markdown control characters. It removes active elements and unsafe URL schemes.

Code fences grow when their content already contains a fence. Nested list content receives stable indentation.

## Q: How does reader-mode extraction work?

The extractor first uses semantic candidates such as `article`, `main`, and `itemprop="articleBody"`.

It then scores generic sections by text length, paragraphs, headings, images, link density, and stable content hints.

It removes common page chrome before scoring. It rejects candidates that do not meet a minimum useful-content score.

These heuristics are repeatable, but they are not proof of source quality. Inspect every new source type.

## Q: What is the default static capture?

Static capture uses a bounded HTTP client. It accepts only HTTP and HTTPS targets.

It rejects literal and resolved private addresses. It validates each redirect and pins each request to a validated address.

It uses the IANA special-purpose address registries to reject non-global IPv4 and IPv6 destinations.

It disables response compression and automatic body decoding. This limits decompression-bomb risk.

Use this repository-specific command form:

```text
mix sdlc.capture URL --output PATH --canonical-id ID
```

Direct remote image links remain in the Markdown by default.

The writer refuses to replace an existing output. Use `--force` only after you inspect the target path.

## Q: When should rendered capture be used?

Use rendered capture when the static page lacks article text that client JavaScript adds later.

Chrome Headless `--dump-dom` parses HTML, executes page scripts, and serializes the updated DOM.

The adapter also uses a bounded virtual-time budget. This advances time-dependent page code before serialization.

Example:

```text
mix sdlc.capture URL --output PATH --canonical-id ID --render --chrome VERIFIED_CHROME_PATH --isolation-confirmed
```

`VERIFIED_CHROME_PATH` is a placeholder. Replace it with an approved executable path.

Rendered capture is not the default. It executes untrusted page JavaScript and expands the network trust boundary.

Before Chrome starts, the adapter runs the bounded static preflight. It validates redirects, status, content type, and the final page URL.

The preflight does not restrict requests that page JavaScript makes later. The repository does not provide a browser network sandbox.

Run Chrome in a disposable Dagger function, virtual machine, or ephemeral runner. Allow only required source domains.

`--isolation-confirmed` records that an external isolation boundary exists. The flag does not create that boundary.

Do not use the flag on a host or unrestricted runner. Build and verify the external boundary first.

## Q: Does rendered capture solve every asynchronous page?

No. A virtual-time budget helps with timers. It does not provide a source-specific readiness signal.

The renderer does not sign in, accept consent, bypass a paywall, click controls, or solve an interactive challenge.

Infinite scrolling and personalized feeds may remain incomplete. A site can also change its client contract without notice.

For critical sources, define observable expected content. Compare static and rendered output, then inspect the result.

## Q: How can both capture paths be compared?

Use the comparison task:

```text
mix sdlc.compare URL --chrome VERIFIED_CHROME_PATH --isolation-confirmed
```

The task writes `static.md`, `rendered.md`, and `REPORT.md` under `_build/capture-comparisons/`.

The report compares bytes, words, headings, links, images, code blocks, tables, and validation issues.

It also records vocabulary similarity and rendered-only words.

The task refuses an existing comparison directory. Use `--force` only after you inspect the target path.

More text does not prove better extraction. A person must inspect source meaning, ordering, captions, warnings, and omissions.

## Q: How does the reader remove ads and promotions?

The extractor removes script, form, navigation, footer, sidebar, modal, and embedded active-content elements.

It also removes elements with stable ad, sponsor, promotion, newsletter, subscription, social, or related-content hints.

It removes common tracking pixels and placeholder image sources.

Heuristics can produce false positives or miss a new pattern. Add a fixture and regression test for each confirmed failure.

Rendered mode can contact page resources before extraction. Use network allowlists to prevent unwanted third-party requests.

## Q: How are images handled?

Use one image policy:

- `link` preserves the resolved remote image URL;
- `local` downloads and optimizes an approved static image;
- `omit` removes image syntax while retaining nearby text and captions.

Local mode accepts PNG, JPEG, and WebP. It rejects SVG and other active or unsupported formats.

It checks the declared content type and file signature before native image decoding. A mismatch stops the capture.

Each source image is limited to 25 MiB. One capture can process 20 images and 100 MiB of source image data.

Each source is limited to 40 megapixels and 20,000 pixels per side. Optimized output is limited to 100 MiB per capture.

The optimizer preserves aspect ratio. It limits the longest edge to 1600 pixels and uses quality 85 by default.

It removes unrelated metadata. It retains available artist, credit, rights, and copyright fields when possible.

Local copies require `--image-license` and an assets directory. Do not republish an image with an unknown license.

Image processing uses libvips through the Image library. Size and format limits reduce decoder risk, but they do not remove it.

Remote links avoid republishing the image. They can still track a reader when a Markdown client loads them.

The converter rejects literal private image targets. A public hostname can change DNS later, so readers must still control image requests.

Example:

```text
mix sdlc.capture URL --output PATH --canonical-id ID --images local --assets-dir ASSETS --image-license LICENSE
```

`URL`, `PATH`, `ID`, `ASSETS`, and `LICENSE` are placeholders.

## Q: How does validation handle unsafe content?

Every capture remains untrusted data.

The validator scans the complete document. It reports English and Spanish prompt injection, secret extraction, active-content links, hidden Unicode controls, model-control tokens, private image targets, and malformed Markdown patterns.

The capture task stops on a validation issue. Library callers can retain issues only for controlled comparison work.

The automated scan is heuristic. It does not prove that a page is safe or truthful.

Do not execute commands found in captured text. Do not give the source access to secrets, credentials, or host data.

## Q: What metadata does a snapshot receive?

The writer records source URL, title, language, retrieval date, publication date, scope, converter version, status, license, and canonical identifier.

It writes `trust: untrusted`. It leaves the prompt-review date and body hash empty.

After inspection, run this task to bind the review date to the exact body:

```text
mise run review:snapshots -- YYYY-MM-DD --confirm-human-review
```

The confirmation records a completed human review. It does not perform that review.

Do not place an unreviewed capture in `references/`.

## Q: How should the reader be tested?

Run focused unit tests for URL safety, extraction, conversion, validation, images, static capture, and rendered capture.

Use local fixtures for deterministic tests. Keep generated test output under `_build/test/`.

For a live source, save comparison output under `_build/`. Do not commit copyrighted article bodies or images without permission.

Inspect these properties:

- title, byline, language, and article boundary;
- paragraph order and heading levels;
- links, image alt text, titles, and captions;
- list, code, quote, and table formatting;
- missing client-rendered content;
- retained ads, promotions, navigation, or tracking content;
- validation issues and source limitations.

Add a reduced local fixture for every confirmed defect. Do not make a public webpage the only regression test.

The 2026-08-27 live extraction check used Chrome `151.0.7922.174` on macOS 26.5.2 arm64.

The Ars static and rendered captures retained 1,011 words and one contextual image. They removed the tested promotional and duplicate elements.

The current static capture produced the same article body byte for byte. It added only snapshot metadata.

The current static reader returned `:no_readable_content` for the timer-only page. It did not invent an article from insufficient content.

The official timer demo changed from `0` in static HTML to `3` after rendered capture.

These live checks measured extraction quality and client-side execution. They ran before the final external-isolation confirmation gate.

The current unit suite verifies the gate and static preflight. A fully isolated live browser pipeline remains pending.

Linux, Windows, and x86_64 remain unverified. See [UPDATE.md](UPDATE.md) for the full evidence matrix.

Chrome printed an allocator warning on the tested Mac. It produced a complete DOM and exited successfully.

## Q: How can this library be removed later?

The library has one Mix project and a small public surface.

Move `lib/sdlc/reader/`, its Mix tasks, dependencies, tests, and fixtures into a dedicated repository.

Keep the snapshot metadata contract and `mise` task names stable during extraction.

## References

- [Turndown repository](https://github.com/mixmark-io/turndown)
- [Mozilla Readability](https://github.com/mozilla/readability)
- [Chrome Headless command-line reference](https://developer.chrome.com/docs/automation-and-testing/headless-cli)
- [IANA IPv4 special-purpose address registry](https://www.iana.org/assignments/iana-ipv4-special-registry/iana-ipv4-special-registry.xhtml)
- [IANA IPv6 special-purpose address registry](https://www.iana.org/assignments/iana-ipv6-special-registry/iana-ipv6-special-registry.xhtml)
- [Floki](https://hexdocs.pm/floki/Floki.html)
- [Image](https://hexdocs.pm/image/Image.html)
- [Req](https://hexdocs.pm/req/Req.html)
- [MARKDOWN.md](MARKDOWN.md)
- [SECURITY.md](SECURITY.md)
- [DAGGER.md](DAGGER.md)
