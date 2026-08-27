# NOTES

This guide defines a cross-platform contract for recordings, transcripts, and engineering notes.

## Q: What must a recording and notes system provide?

- Explicit approval before recording starts.
- A visible recording state during capture.
- Local-first capture by default.
- Separate raw audio, transcript, summary, decisions, and action items.
- Speaker and time metadata when available.
- Searchable, exportable, versionable notes.
- Redaction before sharing or model processing.
- Retention and deletion controls.
- Offline operation with safe retry when synchronization returns.
- A clear owner and access policy.

## Q: When may a system record?

Record only after every recorded person gives explicit approval. The system must state the capture scope before recording starts. The scope includes microphone audio, system audio, meeting audio, editor content, and private messages.

The system must show a persistent recording indicator. It must provide a clear stop control. It must record the approval, people, scope, time, and retention policy with the recording.

Obtain new approval when the scope, participants, destination, or processing purpose changes. Do not record when a required approval is absent, withdrawn, or unclear.

## Q: What is the macOS example?

Quill is a minimal macOS recording and transcription example. Use it as a local-capture reference. Do not treat it as a universal platform contract.

Before adoption, verify its build, permissions, transcription path, and data storage behavior.

## Q: What must Windows and Linux implementations do?

Implement the same behavior contract with native capture APIs or a trusted recorder. Use operating-system permission prompts, a visible status indicator, encrypted local storage, and a local or approved transcription engine.

Windows may use Windows audio capture and a local transcription service. Linux may use PipeWire or PulseAudio through a reviewed application. These are implementation choices. The contract must remain independent of them.

Do not silently capture microphone audio, system audio, meetings, editor content, or private messages. Do not upload recordings to a hosted model without explicit approval and a documented data-processing decision.

## Q: How should notes enter the SDLC?

Convert a recording into a reviewed decision record, work item, specification change, or research record. Keep raw recordings outside the repository unless the project explicitly requires them. Store only the evidence needed to reproduce the decision.

## References

- Quill
- [NIST Privacy Framework](https://www.nist.gov/privacy-framework)
- [W3C WebRTC](https://www.w3.org/TR/webrtc/)
