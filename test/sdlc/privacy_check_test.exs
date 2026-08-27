Code.require_file("../../scripts/lib/privacy_check.exs", __DIR__)

defmodule Sdlc.PrivacyCheckTest do
  use ExUnit.Case, async: true

  alias Sdlc.PrivacyCheck

  test "allows reserved example addresses and Git transport addresses" do
    addresses = [
      "person@example.test",
      "git@github.com",
      "account@users.noreply.github.com",
      Enum.join(["privacy", "nvidia.com"], "@")
    ]

    documents = [
      {"guide.md", Enum.join(addresses, "\n")}
    ]

    assert PrivacyCheck.findings(documents) == []
  end

  test "reports only the location and category for detected values" do
    email = Enum.join(["person", "private.invalid"], "@")
    government_id = Enum.join(["000", "00", "0000"], "-")
    documents = [{"guide.md", "Contact #{email} or use #{government_id}."}]

    error = assert_raise RuntimeError, fn -> PrivacyCheck.validate!(documents) end

    assert error.message =~ "guide.md:1 contains an email address"
    assert error.message =~ "guide.md:1 contains a government identifier pattern"
    refute error.message =~ email
    refute error.message =~ government_id
  end

  test "reports an account-bearing Gist URL without repeating it" do
    owner = Enum.join(["personal", "handle"], "-")
    gist_url = "https://gist.github.com/#{owner}/#{String.duplicate("a", 32)}"

    error =
      assert_raise RuntimeError, fn ->
        PrivacyCheck.validate!([{"guide.md", gist_url}])
      end

    assert error.message =~ "guide.md:1 contains a Gist account identifier"
    refute error.message =~ gist_url
  end

  test "reports common separated phone formats without repeating them" do
    domestic = Enum.join(["212", "555", "1234"], "-")
    international = "+1 " <> Enum.join(["212", "555", "1234"], " ")
    adjacent = "(212)" <> Enum.join(["555", "1234"], "-")
    country_adjacent = "+1(212)" <> Enum.join(["555", "1234"], "-")
    one_digit_area = "+64(9)" <> Enum.join(["123", "4567"], "-")

    error =
      assert_raise RuntimeError, fn ->
        PrivacyCheck.validate!([
          {"guide.md",
           Enum.join([domestic, international, adjacent, country_adjacent, one_digit_area], "\n")}
        ])
      end

    assert error.message =~ "guide.md:1 contains a phone number pattern"
    assert error.message =~ "guide.md:2 contains a phone number pattern"
    assert error.message =~ "guide.md:3 contains a phone number pattern"
    assert error.message =~ "guide.md:4 contains a phone number pattern"
    assert error.message =~ "guide.md:5 contains a phone number pattern"
    refute error.message =~ domestic
    refute error.message =~ international
    refute error.message =~ adjacent
    refute error.message =~ country_adjacent
    refute error.message =~ one_digit_area
  end

  test "reports a parenthesized mobile phone format without repeating it" do
    international_mobile = "+55(11)" <> Enum.join(["91234", "5678"], "-")
    domestic_mobile = "(11)" <> Enum.join(["91234", "5678"], "-")

    error =
      assert_raise RuntimeError, fn ->
        PrivacyCheck.validate!([
          {"guide.md", Enum.join([international_mobile, domestic_mobile], "\n")}
        ])
      end

    assert error.message =~ "guide.md:1 contains a phone number pattern"
    assert error.message =~ "guide.md:2 contains a phone number pattern"
    refute error.message =~ international_mobile
    refute error.message =~ domestic_mobile

    product_id = Enum.join(["123", "45678", "9012"], "-")
    assert PrivacyCheck.findings([{"guide.md", product_id}]) == []
  end

  test "reports grouped international phone formats without repeating them" do
    two_groups = "+91 " <> Enum.join(["98765", "43210"], " ")
    one_digit_group = "+33 " <> Enum.join(["1", "42", "68", "53", "00"], " ")
    wide_group = "+49.30." <> Enum.join(["1234", "5678"], "")

    error =
      assert_raise RuntimeError, fn ->
        PrivacyCheck.validate!([
          {"guide.md", Enum.join([two_groups, one_digit_group, wide_group], "\n")}
        ])
      end

    assert error.message =~ "guide.md:1 contains an international phone number pattern"
    assert error.message =~ "guide.md:2 contains an international phone number pattern"
    assert error.message =~ "guide.md:3 contains an international phone number pattern"
    refute error.message =~ two_groups
    refute error.message =~ one_digit_group
    refute error.message =~ wide_group

    too_short = "+12 " <> Enum.join(["34", "56"], " ")
    assert PrivacyCheck.findings([{"guide.md", too_short}]) == []
  end

  test "reports short compact and one-group international phone formats" do
    country = "+298"
    national = Enum.join(["123", "456"], "")
    compact = country <> national
    one_group = country <> " " <> national

    error =
      assert_raise RuntimeError, fn ->
        PrivacyCheck.validate!([{"guide.md", Enum.join([compact, one_group], "\n")}])
      end

    assert error.message =~ "guide.md:1 contains an international phone number pattern"
    assert error.message =~ "guide.md:2 contains an international phone number pattern"
    refute error.message =~ compact
    refute error.message =~ one_group
  end

  test "reports international phone formats with nonbreaking spaces" do
    regular_space = <<0xC2, 0xA0>>
    figure_space = <<0xE2, 0x80, 0x87>>
    narrow_space = <<0xE2, 0x80, 0xAF>>
    thin_space = <<0xE2, 0x80, 0x89>>
    groups = ["1", "42", "68", "53", "00"]
    regular = "+33" <> regular_space <> Enum.join(groups, regular_space)
    figure = "+33" <> figure_space <> Enum.join(groups, figure_space)
    narrow = "+33" <> narrow_space <> Enum.join(groups, narrow_space)
    thin = "+33" <> thin_space <> Enum.join(groups, thin_space)

    error =
      assert_raise RuntimeError, fn ->
        PrivacyCheck.validate!([
          {"guide.md", Enum.join([regular, figure, narrow, thin], "\n")}
        ])
      end

    assert error.message =~ "guide.md:1 contains an international phone number pattern"
    assert error.message =~ "guide.md:2 contains an international phone number pattern"
    assert error.message =~ "guide.md:3 contains an international phone number pattern"
    assert error.message =~ "guide.md:4 contains an international phone number pattern"
    refute error.message =~ regular
    refute error.message =~ figure
    refute error.message =~ narrow
    refute error.message =~ thin
  end

  test "reports adjacent country and area codes" do
    adjacent = "+44" <> "161" <> " " <> Enum.join(["496", "0123"], " ")

    error =
      assert_raise RuntimeError, fn ->
        PrivacyCheck.validate!([{"guide.md", adjacent}])
      end

    assert error.message =~ "guide.md:1 contains an international phone number pattern"
    refute error.message =~ adjacent
  end

  test "reports an international trunk marker" do
    trunk = "+33 " <> "(0)" <> "1 " <> Enum.join(["42", "68", "53", "00"], " ")
    maximum = "+49 " <> "(0) " <> Enum.join(["1234", "1234567", "89"], " ")
    overlong = "+49 " <> "(0) " <> Enum.join(["1234", "1234567", "890"], " ")

    error =
      assert_raise RuntimeError, fn ->
        PrivacyCheck.validate!([{"guide.md", Enum.join([trunk, maximum], "\n")}])
      end

    assert error.message =~ "guide.md:1 contains an international phone number pattern"
    assert error.message =~ "guide.md:2 contains an international phone number pattern"
    refute error.message =~ trunk
    refute error.message =~ maximum
    assert PrivacyCheck.findings([{"guide.md", overlong}]) == []
  end

  test "reports one subscriber group after a parenthesized area code" do
    international = "+49 " <> "(30) " <> "901820"
    domestic = "(030) " <> "901820"

    error =
      assert_raise RuntimeError, fn ->
        PrivacyCheck.validate!([{"guide.md", Enum.join([international, domestic], "\n")}])
      end

    assert error.message =~ "guide.md:1 contains a phone number pattern"
    assert error.message =~ "guide.md:2 contains a phone number pattern"
    refute error.message =~ international
    refute error.message =~ domestic
  end

  test "enforces the international digit ceiling for mobile formats" do
    maximum = "+358" <> "(123)" <> Enum.join(["56789", "0123"], "-")
    overlong = "+358" <> "(1234)" <> Enum.join(["56789", "0123"], "-")

    assert [%{category: "a phone number pattern"}] =
             PrivacyCheck.findings([{"guide.md", maximum}])

    assert PrivacyCheck.findings([{"guide.md", overlong}]) == []
  end

  test "reports two-group and four-group domestic phone formats" do
    two_groups = Enum.join(["098765", "43210"], " ")
    four_groups = Enum.join(["22", "12", "34", "56"], " ")
    uneven_groups = Enum.join(["030", Enum.join(["1234", "5678"], "")], " ")
    hyphen_groups = Enum.join(["098765", "43210"], "-")
    dot_groups = Enum.join(["098765", "43210"], ".")

    error =
      assert_raise RuntimeError, fn ->
        PrivacyCheck.validate!([
          {"guide.md",
           Enum.join(
             [two_groups, four_groups, uneven_groups, hyphen_groups, dot_groups],
             "\n"
           )}
        ])
      end

    assert error.message =~ "guide.md:1 contains a phone number pattern"
    assert error.message =~ "guide.md:2 contains a phone number pattern"
    assert error.message =~ "guide.md:3 contains a phone number pattern"
    assert error.message =~ "guide.md:4 contains a phone number pattern"
    assert error.message =~ "guide.md:5 contains a phone number pattern"
    refute error.message =~ two_groups
    refute error.message =~ four_groups
    refute error.message =~ uneven_groups
    refute error.message =~ hyphen_groups
    refute error.message =~ dot_groups
  end

  test "reports bounded bare compact domestic phone formats" do
    compact = Enum.join(["212", "555", "1234"], "")
    embedded = "build" <> compact
    overlong = compact <> "12"
    international_tail = "+12345" <> Enum.join(["67890", "12345"], "") <> "-6"
    domestic_tail = Enum.join(["123", "456", "78901"], "") <> "-2"
    url_identifier = Enum.join(["4915", "1933"], "")
    url = "https://news.example.test/item?id=" <> url_identifier

    error =
      assert_raise RuntimeError, fn ->
        PrivacyCheck.validate!([{"guide.md", compact}])
      end

    assert error.message =~ "guide.md:1 contains a phone number pattern"
    refute error.message =~ compact
    assert PrivacyCheck.findings([{"guide.md", embedded}]) == []
    assert PrivacyCheck.findings([{"guide.md", overlong}]) == []
    assert PrivacyCheck.findings([{"guide.md", international_tail}]) == []
    assert PrivacyCheck.findings([{"guide.md", domestic_tail}]) == []
    assert PrivacyCheck.findings([{"guide.md", url}]) == []
  end

  test "keeps ambiguous grouped values blocked and rejects overlong domestic identifiers" do
    ambiguous = Enum.join(["12", "34", "56", "78", "90"], ".")
    part_identifier = Enum.join(["1234", "5678", "9012"], "-")
    research_identifier = Enum.join(["2608", "23041"], ".")
    research_url = "https://arxiv.org/abs/" <> research_identifier
    doi_identifier = Enum.join(["2022", "107210"], ".")
    doi_url = "https://doi.org/10.1016/j.infsof." <> doi_identifier
    year_range = Enum.join(["2022", "2025"], "-")
    version_suffix = ambiguous <> "beta"
    grouped_query_identifier = Enum.join(["12", "34", "56", "78"], ".")
    grouped_query_url = "https://news.example.test/item?id=" <> grouped_query_identifier

    assert [%{category: "a phone number pattern"}] =
             PrivacyCheck.findings([{"guide.md", ambiguous}])

    assert PrivacyCheck.findings([{"guide.md", part_identifier}]) == []
    assert PrivacyCheck.findings([{"guide.md", research_url}]) == []
    assert PrivacyCheck.findings([{"guide.md", doi_url}]) == []
    assert PrivacyCheck.findings([{"guide.md", year_range}]) == []
    assert PrivacyCheck.findings([{"guide.md", version_suffix}]) == []
    assert PrivacyCheck.findings([{"guide.md", grouped_query_url}]) == []
  end

  test "reports a five-group domestic phone format without repeating it" do
    domestic = Enum.join(["01", "23", "45", "67", "89"], " ")

    error =
      assert_raise RuntimeError, fn ->
        PrivacyCheck.validate!([{"guide.md", domestic}])
      end

    assert error.message =~ "guide.md:1 contains a phone number pattern"
    refute error.message =~ domestic
  end

  test "reports a tracked path identifier without repeating the path" do
    root = temporary_repository!()
    on_exit(fn -> File.rm_rf!(root) end)

    private_email = Enum.join(["person", "private.invalid"], "@")
    private_path = "#{private_email}.md"
    File.write!(Path.join(root, private_path), "Safe content.\n")
    git!(root, ["add", private_path])

    error =
      assert_raise RuntimeError, fn ->
        root
        |> PrivacyCheck.tracked_documents!()
        |> PrivacyCheck.validate!()
      end

    assert error.message =~ "tracked path #1 (redacted):path contains an email address"
    refute error.message =~ private_email
    refute error.message =~ private_path
  end

  test "reports phone identifiers in nested tracked path components" do
    compact = Enum.join(["212", "555", "1234"], "")
    parenthesized = "(" <> "212" <> ")" <> Enum.join(["555", "1234"], "-")

    findings =
      PrivacyCheck.findings([
        {"contacts/#{compact}.txt", ""},
        {"contacts/id=#{parenthesized}.txt", ""}
      ])

    assert %{file: "tracked path #1 (redacted)", line: "path", category: category} =
             Enum.find(findings, &(&1.file == "tracked path #1 (redacted)"))

    assert category == "a phone number pattern"

    assert %{file: "tracked path #2 (redacted)", line: "path", category: category} =
             Enum.find(findings, &(&1.file == "tracked path #2 (redacted)"))

    assert category == "a phone number pattern"
    refute inspect(findings) =~ compact
    refute inspect(findings) =~ parenthesized
  end

  test "redacts a tracked path when the worktree file cannot be read" do
    root = temporary_repository!()
    on_exit(fn -> File.rm_rf!(root) end)

    private_email = Enum.join(["person", "private.invalid"], "@")
    private_path = "blocked/#{private_email}.md"
    source_path = Path.join(root, "source.md")
    File.write!(source_path, "Safe content.\n")

    assert {object, 0} =
             System.cmd("git", ["hash-object", "-w", "source.md"],
               cd: root,
               stderr_to_stdout: true
             )

    git!(root, [
      "update-index",
      "--add",
      "--cacheinfo",
      "100644",
      String.trim(object),
      private_path
    ])

    File.write!(Path.join(root, "blocked"), "This path component is not a directory.\n")

    error =
      assert_raise RuntimeError, fn ->
        PrivacyCheck.tracked_documents!(root)
      end

    assert error.message =~ "tracked path #1 (redacted)"
    refute error.message =~ private_email
    refute error.message =~ private_path
  end

  test "reports a tracked path identifier for a binary blob" do
    root = temporary_repository!()
    on_exit(fn -> File.rm_rf!(root) end)

    private_email = Enum.join(["person", "private.invalid"], "@")
    private_path = "#{private_email}.bin"
    File.write!(Path.join(root, private_path), <<0xFF, 0x00>>)
    git!(root, ["add", private_path])

    error =
      assert_raise RuntimeError, fn ->
        root
        |> PrivacyCheck.tracked_documents!()
        |> PrivacyCheck.validate!()
      end

    assert error.message =~ "tracked path #1 (redacted):path contains an email address"
    refute error.message =~ private_email
    refute error.message =~ private_path
  end

  test "does not scan the destination content of a tracked symlink" do
    root = temporary_repository!()
    outside = root <> "-outside"

    on_exit(fn ->
      File.rm_rf!(root)
      File.rm_rf!(outside)
    end)

    private_email = Enum.join(["person", "private.invalid"], "@")
    File.mkdir_p!(outside)
    target = Path.join(outside, "target.txt")
    File.write!(target, "Contact #{private_email}.\n")
    File.ln_s!(target, Path.join(root, "reference-link"))
    git!(root, ["add", "reference-link"])

    assert root |> PrivacyCheck.tracked_documents!() |> PrivacyCheck.validate!() == :ok
  end

  test "scans staged content when the worktree contains a safe replacement" do
    root = temporary_repository!()
    on_exit(fn -> File.rm_rf!(root) end)

    relative_path = "guide.md"
    path = Path.join(root, relative_path)
    private_email = Enum.join(["private", "invalid.local"], "@")

    File.write!(path, "Contact #{private_email}.\n")
    git!(root, ["add", relative_path])
    File.write!(path, "Contact person@example.test.\n")

    error =
      assert_raise RuntimeError, fn ->
        root
        |> PrivacyCheck.tracked_documents!()
        |> PrivacyCheck.validate!()
      end

    assert error.message =~ "guide.md:1 contains an email address"
    refute error.message =~ private_email
  end

  test "scans changed worktree content when the index contains a safe value" do
    root = temporary_repository!()
    on_exit(fn -> File.rm_rf!(root) end)

    relative_path = "guide.md"
    path = Path.join(root, relative_path)
    private_email = Enum.join(["private", "invalid.local"], "@")

    File.write!(path, "Contact person@example.test.\n")
    git!(root, ["add", relative_path])
    File.write!(path, "Contact #{private_email}.\n")

    error =
      assert_raise RuntimeError, fn ->
        root
        |> PrivacyCheck.tracked_documents!()
        |> PrivacyCheck.validate!()
      end

    assert error.message =~ "guide.md (worktree):1 contains an email address"
    refute error.message =~ private_email
  end

  defp temporary_repository! do
    root =
      Path.join(
        System.tmp_dir!(),
        "sdlc-privacy-check-#{System.unique_integer([:positive, :monotonic])}"
      )

    File.mkdir_p!(root)
    git!(root, ["init", "--quiet"])
    root
  end

  defp git!(root, arguments) do
    assert {_, 0} = System.cmd("git", arguments, cd: root, stderr_to_stdout: true)
  end
end
