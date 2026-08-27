# AGENT-SKILLS

Companion guidance extracted from the SDLC document.

This file is the focused reference for research evidence, Agent Skills structure, distribution, versioning, and trust.
## Research practice

Research must answer a defined question.

Each research record should include:

- question;
- source;
- source date;
- finding;
- limitation;
- local decision;
- affected specification;
- affected feature;
- follow-up work.

Prefer authoritative and primary sources.

Separate external facts from local decisions.

Do not turn a source summary into a product requirement without a documented
decision.

## Agent Skills practice

Use the Agent Skills format for reusable agent capabilities.

A skill should contain:

```text
skill-name/
├── SKILL.md
├── scripts/
├── references/
├── assets/
└── examples/
```

Only `SKILL.md` is required.

Use progressive disclosure:

1. discover the skill by name and description;
2. activate it when the task matches;
3. read supporting files only when needed;
4. execute the documented workflow.

Create a new shared skill only when:

- the workflow repeats across projects;
- the workflow has stable inputs and outputs;
- the workflow has clear safety rules;
- the workflow has validation evidence;
- an existing skill does not cover the need.

Before creating a new skill:

- search the team skill repository;
- search the Agent Skills ecosystem;
- inspect existing related skills;
- record reuse, adaptation, and replacement decisions.

Useful references include:

- https://agentskills.io/home
- https://github.com/vercel-labs/skills
- https://www.skills.sh/
- https://github.com/danyuchn/asd-ste100-skill

Keep shared skills project neutral.

Keep project-specific rules in the project repository.

### Skill distribution and supply-chain controls

Use `npx skills` or an equivalent installer only from a reviewed source. Inspect the repository, `SKILL.md`, scripts, references, assets, package metadata, install hooks, and generated files before activation.

Use project-scoped skills when the workflow is part of the repository contract and must be reviewed with the code. Use user-scoped skills for personal, low-risk preferences that must work across repositories. Use organization plugins or a private skills bundle when the organization owns the workflow, needs shared updates, or needs controlled tool permissions.

Prefer a versioned source reference, immutable commit or tag, checksum or lock record, reviewed license, and reproducible installation. Record the source URL, revision, selected skill names, installation scope, target agents, review owner, and update policy. Do not install an entire repository when one skill is sufficient.

Keep executable scripts minimal and inspect them before execution. Prefer local scripts with pinned runtimes. Do not allow a skill to download arbitrary code, read unrelated files, access production systems, or send source and logs to a hosted service without an explicit trust decision.

`npx skills add` supports project and global installation, selected skills, agent selection, local paths, Git sources, and direct URLs. `npx skills use` can use a skill without installing it. Use these modes deliberately and record the choice.

Use the NakamaDevs private skills marketplace as the organization source for reviewed shared bundles. Keep repository-specific skills in the repository. Use a skills lock record or equivalent manifest for exact revisions. Review updates as code and run skill-level tests before promotion.

References:

- [Agent Skills specification and format](https://agentskills.io/home)
- [npx skills CLI](https://github.com/vercel-labs/skills)
- [NakamaDevs skills marketplace](https://github.com/NakamaDevs/skills)

