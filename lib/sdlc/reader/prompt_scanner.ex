defmodule Sdlc.Reader.PromptScanner do
  @moduledoc "Deterministic indicators for prompt injection and unsafe Markdown content."

  alias Sdlc.Reader.URL

  @patterns [
    {:prompt_injection,
     ~r/\b(?:ignore|disregard|override)\b.{0,80}\b(?:previous|prior|above|system|developer)\b.{0,40}\b(?:instruction|message|prompt)s?\b/isu},
    {:prompt_injection,
     ~r/\b(?:ignora|ignore|omite|desobedece)\b.{0,80}\b(?:instrucciones|mensaje|prompt)\b.{0,40}\b(?:anteriores|previas|del sistema|del desarrollador)\b/isu},
    {:prompt_injection,
     ~r/\b(?:reveal|display|print|return|show)\b.{0,50}\b(?:system prompt|developer message|hidden instructions?)\b/isu},
    {:prompt_injection,
     ~r/\b(?:revela|muestre|muestra|imprime|devuelve)\b.{0,50}\b(?:prompt del sistema|mensaje del desarrollador|instrucciones ocultas)\b/isu},
    {:secret_extraction,
     ~r/\b(?:send|upload|exfiltrate|print|return|reveal)\b.{0,50}\b(?:secrets?|credentials?|access tokens?|private keys?)\b/isu},
    {:secret_extraction,
     ~r/\b(?:envía|envie|sube|imprime|devuelve|extrae|revela)\b.{0,50}\b(?:secretos?|credenciales?|tokens? de acceso|claves? privadas?)\b/isu},
    {:prompt_injection,
     ~r/\b(?:you are now|act as the system|follow these instructions instead)\b/isu},
    {:prompt_injection,
     ~r/\b(?:ahora eres|actúa como el sistema|sigue estas instrucciones en su lugar)\b/isu},
    {:prompt_injection,
     ~r/\b(?:do not tell|hide this from)\b.{0,30}\b(?:user|human|reviewer)\b/isu},
    {:prompt_injection,
     ~r/\b(?:no (?:se lo )?digas|oculta esto)\b.{0,30}\b(?:usuario|persona|revisor)\b/isu},
    {:model_control_token,
     ~r/(?:<\|(?:system|developer|assistant|tool|im_start|im_end)\|>|<<SYS>>|\[(?:SYSTEM|INST)\]|BEGIN (?:SYSTEM|DEVELOPER) (?:PROMPT|MESSAGE))/iu},
    {:model_control_token, ~r/(?:&lt;(?:system|developer|assistant)&gt;|&#x?0*3c;\|?system)/iu},
    {:active_content_link,
     ~r/(?:!?)\[[^\]]*\]\(\s*(?:javascript\s*:|data\s*:\s*text\/html|vbscript\s*:|file\s*:|about\s*:)/isu},
    {:active_content_link,
     ~r/<(?:a|img|iframe|object|embed|script)\b[^>]+\b(?:href|src)\s*=\s*["']?\s*(?:javascript|data\s*:\s*text\/html|vbscript|file|about)\s*:/isu}
  ]

  @image_destination ~r/!\[(?:\\.|[^\]])*\]\(\s*(?<destination><[^>]+>|[^\s\)]+)/u

  @hidden_codepoints [
    0x200B,
    0x200C,
    0x200D,
    0x200E,
    0x200F,
    0x202A,
    0x202B,
    0x202C,
    0x202D,
    0x202E,
    0x2060,
    0x2066,
    0x2067,
    0x2068,
    0x2069,
    0xFEFF
  ]

  @type issue :: %{required(:kind) => atom(), required(:index) => non_neg_integer()}

  @spec scan(binary()) :: [issue()]
  def scan(text) when is_binary(text) do
    ((@patterns
      |> Enum.flat_map(fn {kind, pattern} -> pattern_issues(text, kind, pattern) end)) ++
       hidden_unicode_issues(text) ++ private_image_issues(text))
    |> Enum.uniq_by(&{&1.kind, &1.index})
    |> Enum.sort_by(& &1.index)
  end

  def scan(_text), do: [%{kind: :invalid_input, index: 0}]

  @spec label(atom()) :: String.t()
  def label(:prompt_injection), do: "prompt-injection indicator"
  def label(:secret_extraction), do: "secret-extraction indicator"
  def label(:model_control_token), do: "model-control token"
  def label(:active_content_link), do: "active-content link"
  def label(:hidden_unicode), do: "hidden Unicode control"
  def label(:private_image_destination), do: "private image destination"
  def label(:invalid_input), do: "invalid scanner input"
  def label(kind), do: Atom.to_string(kind)

  defp pattern_issues(text, kind, pattern) do
    pattern
    |> Regex.scan(text, return: :index, capture: :first)
    |> Enum.flat_map(fn [{index, length}] ->
      if kind == :secret_extraction and safe_secret_context?(text, index, length) do
        []
      else
        [%{kind: kind, index: index}]
      end
    end)
  end

  defp safe_secret_context?(text, index, length) do
    start = max(index - 32, 0)
    prefix = binary_part(text, start, index - start)
    matched = binary_part(text, index, length)

    Regex.match?(~r/\b(?:do not|must not|never|don't|no|nunca)\s*$/iu, prefix) or
      Regex.match?(
        ~r/\b(?:without|sin)\s+(?:secrets?|credentials?|access tokens?|private keys?|secretos?|credenciales?|tokens? de acceso|claves? privadas?)\b/iu,
        matched
      )
  end

  defp hidden_unicode_issues(text) do
    Enum.flat_map(@hidden_codepoints, fn codepoint ->
      encoded = <<codepoint::utf8>>

      text
      |> :binary.matches(encoded)
      |> Enum.map(fn {index, _length} -> %{kind: :hidden_unicode, index: index} end)
    end)
  end

  defp private_image_issues(text) do
    @image_destination
    |> Regex.scan(text, return: :index, capture: ["destination"])
    |> Enum.flat_map(fn [{index, length}] ->
      destination = text |> binary_part(index, length) |> String.trim("<>")

      case URL.validate(destination) do
        {:error, :private_address} -> [%{kind: :private_image_destination, index: index}]
        _ -> []
      end
    end)
  end
end
