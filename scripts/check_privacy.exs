Code.require_file("lib/privacy_check.exs", __DIR__)

root = Path.expand("..", __DIR__)
documents = Sdlc.PrivacyCheck.tracked_documents!(root)

Sdlc.PrivacyCheck.validate!(documents)
IO.puts("Privacy checks passed for #{length(documents)} tracked text versions.")
