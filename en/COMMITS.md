# COMMITS

This guide defines semantic and atomic commits for people and agents.

## Q: What commit form should we use?

Use Conventional Commits:

```text
<type>(<optional-scope>): <summary>
```

Examples:

```text
feat(reader): add rendered page capture
fix(ci): stop privileged jobs on fork requests
docs(branches): remove identity segments
```

Use a body when the reason, risk, migration, or evidence needs more detail.

## Q: Which commit types should we use?

- `feat` adds observable behavior.
- `fix` corrects a defect.
- `docs` changes documentation only.
- `refactor` changes structure without changing behavior.
- `test` changes tests without changing product behavior.
- `build` changes dependencies or the build system.
- `ci` changes CI configuration.
- `chore` performs bounded maintenance.
- `perf` improves measured performance.
- `style` changes formatting without changing meaning.
- `revert` reverses an earlier commit.

Use the narrowest accurate type. Do not use `chore` to hide a feature or fix.

## Q: What makes a commit semantic?

The type and summary must describe the effect of the commit.

Write the summary as an imperative action. Use lowercase after the colon. Do not add a final period.

Keep technical names exact. Do not change commands, paths, identifiers, versions, or error text for readability.

Use a stable scope when it helps readers. Examples include `reader`, `docs`, `ci`, `security`, and `runners`.

## Q: What makes a commit atomic?

An atomic commit has one coherent purpose. It can be reviewed, tested, and reverted as one unit.

Include required tests with the behavior they protect. Include generated files with their source change.

Keep a schema migration with the code that requires it when separate deployment would break the repository.

Split changes when they have independent outcomes or review risks. Do not split one working change into unusable fragments.

## Q: What belongs in the commit body?

Use the body to explain:

- why the change is necessary;
- what behavior changed;
- which limits remain;
- how the result was verified;
- whether an operator must act.

Wrap prose for readable terminal output. Use active voice and short sentences.

Do not paste complete agent transcripts, large test logs, secrets, tokens, or customer data.

## Q: How should a commit reference work?

Add the Linear issue when it is not clear from the branch or pull request.

Example:

```text
Refs NAK-625
```

Use a breaking-change footer only for a real incompatible contract change:

```text
BREAKING CHANGE: The capture task now requires --canonical-id.
```

Describe migration steps in the body or pull request.

## Q: How should commits handle failures and partial work?

Do not commit a known broken state to a review branch unless the commit documents an intentional test fixture.

Use local worktree state for experiments. Commit after the smallest coherent unit passes its focused checks.

If a required check cannot run, record the exact limitation in the pull request. Do not claim that the check passed.

## Q: How should authorship work?

Use the approved human identity for repository commits. Configure it explicitly when global Git identity is absent.

Do not invent co-authors. Add a co-author only when that person contributed and approved the attribution.

Agent use does not require an identity token in the branch name or commit summary.

## Q: What is the commit sequence for a large change?

Use the smallest sequence that remains useful after every commit.

A common sequence is:

1. add or update tests that define the behavior;
2. implement the behavior and make the tests pass;
3. update user and operator documentation;
4. update generated indexes or release metadata.

Combine steps when separation would create a broken commit. Separate unrelated documentation or policy changes.

## Q: What should reviewers check?

- The message matches the diff.
- The commit has one purpose.
- Tests protect changed behavior.
- Generated output matches its source.
- No secret or unrelated file entered the commit.
- The commit can be reverted without hidden cleanup.

## References

- [Conventional Commits](https://www.conventionalcommits.org/en/v1.0.0/)
- [Git commit documentation](https://git-scm.com/docs/git-commit)
- [BRANCHES.md](BRANCHES.md)
- [TESTING.md](TESTING.md)
- [COMMUNICATION.md](COMMUNICATION.md)
