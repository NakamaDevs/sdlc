# NOTES

This guide defines a cross-platform specification for recording, transcription, and engineering notes.

## Q: What should a recording and notes system provide?

- Explicit consent and visible recording state.
- Local-first capture by default.
- Separate raw audio, transcript, summary, decisions, and action items.
- Speaker and time metadata when available.
- Searchable, exportable, versionable notes.
- Redaction before sharing or model processing.
- Retention and deletion controls.
- Offline operation with safe retry when synchronization returns.
- A clear owner and access policy.

## Q: What is the macOS example?

[Quill](https://github.com/digimata/quill) is an ultra-minimal macOS recording and transcription example. Use it as a reference for a small local capture workflow, not as a universal platform contract. Verify its current build, permissions, transcription path, and data-storage behavior before adopting it.

## Q: What should Windows and Linux implementations do?

Implement the same behavior contract with native capture APIs or a trusted recorder. Use OS permission prompts, a visible status indicator, local encrypted storage, and a local or approved transcription engine.

Windows may use a Windows audio capture implementation and a local transcription service. Linux may use PipeWire or PulseAudio through a reviewed application. These are implementation choices. The specification must remain independent of them.

Do not silently capture microphone, system audio, meetings, editor content, or private messages. Do not upload recordings to a hosted model without explicit consent and a documented data-processing decision.

## Q: How should notes enter the SDLC?

Convert a recording into a reviewed decision record, work item, specification change, or research record. Keep raw recordings outside the repository unless the project explicitly requires them. Store only the minimum evidence needed to reproduce the decision.

## References

- [Quill](https://github.com/digimata/quill)
- [NIST Privacy Framework](https://www.nist.gov/privacy-framework)
- [W3C WebRTC](https://www.w3.org/TR/webrtc/)