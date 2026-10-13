# System discovery record

Status: not yet discovered. Replace each unknown with verified evidence or an assigned question.

## Product

Record the purpose, user roles, domain terms, primary journey, business rules, and acceptance owner.
Separate approved decisions from hypotheses. Add source revision and observation date.

## Repository page template

For each repository, create a page under docs/repositories/ with these fields:

- Purpose, owner, access boundary, source path, remote, branch, commit.
- Entry points, request flow, storage, workers, outbound dependencies, consumers.
- Existing instructions and architecture references.
- Exact install, focused test, integration test, start, status, and stop commands with working directory.
- Required local configuration names, never secret values.
- Synthetic fixtures, known failures, recovery steps, and unverified claims.
- Three exercises: locate behavior, run a check, diagnose a local failure.
- Reviewer, last verified date, and next update trigger.

## Decisions and evidence

Keep decisions under docs/decisions/ with problem, options, choice, owner, source, and reconsideration trigger.
Keep task evidence under docs/work/ with revisions, environment, command, result, artifact path, risk, and next action.
Keep large or sensitive artifacts in the ignored artifacts/ directory with an approved retention policy.
