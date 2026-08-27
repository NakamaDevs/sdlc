# SOURCE SNAPSHOT\n\n- Source URL: https://prek.j178.dev/quickstart/\n- Title: prek quickstart\n- Retrieved: 2026-08-27\n- Conversion: Turndown 7.2.4\n- Status: archival copy; verify the live source for current facts.\n\n---\n\n 

[Skip to content](#quickstart)

[![prek](../assets/logo.png)](./.. "prek")

prek

Quickstart

  

Search

[

j178/prek

](https://github.com/j178/prek "Go to repository")

 [![prek](../assets/logo.png)](./.. "prek")prek

[

j178/prek

](https://github.com/j178/prek "Go to repository")

*   [Getting Started](./..)
    
    Getting Started
    
    *   [Installation](../installation/)
    *   Quickstart [Quickstart](././)
        
        On this page
        
        *   [Already using pre-commit?](#already-using-pre-commit)
        *   [New to pre-commit-style workflows?](#new-to-pre-commit-style-workflows)
            
            *   [1\. Create a configuration](#1-create-a-configuration)
            *   [2\. Run hooks on demand](#2-run-hooks-on-demand)
            *   [3\. Wire hooks into git automatically](#3-wire-hooks-into-git-automatically)
            *   [4\. Go further](#4-go-further)
            
        
    
*    Usage
    
    Usage
    
    *   [Common Workflows](../usage/)
    *   [Configuration](../configuration/)
    *   [Workspace Mode](../workspace/)
    *   [Language Support](../languages/)
    *   [Built-in Hooks](../builtin/)
    *   [Integrations](../integrations/)
    *   [Cookbook](../cookbook/)
    *   [Authoring Hooks](../authoring-hooks/)
    
*    Reference
    
    Reference
    
    *   [CLI Reference](../reference/cli/)
    *   [Configuration Reference](../reference/configuration/)
    *   [Environment Variables](../reference/environment-variables/)
    *   [Internals](../internals/)
    
*    Help
    
    Help
    
    *   [Debugging](../debugging/)
    *   [FAQ](../faq/)
    
*    About
    
    About
    
    *   [Compatibility](../compatibility/)
    *   [Differences](../diff/)
    *   [Benchmark](../benchmark/)
    *   [Changelog](../changelog/)
    

On this page

*   [Already using pre-commit?](#already-using-pre-commit)
*   [New to pre-commit-style workflows?](#new-to-pre-commit-style-workflows)
    
    *   [1\. Create a configuration](#1-create-a-configuration)
    *   [2\. Run hooks on demand](#2-run-hooks-on-demand)
    *   [3\. Wire hooks into git automatically](#3-wire-hooks-into-git-automatically)
    *   [4\. Go further](#4-go-further)
    

# Quickstart[¶](#quickstart "Permanent link")

This page helps you get productive with **prek** in minutes, whether you are migrating from [pre-commit](https://pre-commit.com/) or starting from scratch.

First follow the [installation guide](.././installation/) to install prek on your system.

[I already use pre-commit](#already-using-pre-commit) [I'm new to pre-commit-style tools](#new-to-pre-commit-style-workflows)

## Already using pre-commit?[¶](#already-using-pre-commit "Permanent link")

Great news - prek is designed as a drop-in replacement, you only need two tweaks:

1.  Replace every `pre-commit` command in your scripts or documentation with `prek`. Your existing `.pre-commit-config.yaml` continues to work unchanged.
    
    `[](#__codelineno-0-1)$ prek run [](#__codelineno-0-2)trim trailing whitespace.................................................Passed [](#__codelineno-0-3)fix end of files.........................................................Passed [](#__codelineno-0-4)typos....................................................................Passed [](#__codelineno-0-5)cargo fmt................................................................Passed [](#__codelineno-0-6)cargo clippy.............................................................Passed`
    
2.  Reinstall the Git shims once via `prek install -f` (run this if you previously executed `pre-commit install`).
    

From here you can explore what prek adds on top of pre-commit:

*   [Key differences and new features](.././diff/)
*   [Built-in Rust-native hooks](.././builtin/)
*   [Workspace mode for monorepos](.././workspace/)

## New to pre-commit-style workflows?[¶](#new-to-pre-commit-style-workflows "Permanent link")

Follow this short example to experience how prek automates linting and formatting tasks.

### 1\. Create a configuration[¶](#1-create-a-configuration "Permanent link")

In the root of your repository, add a `prek.toml`:

`[](#__codelineno-1-1)[[repos]] [](#__codelineno-1-2)repo = "https://github.com/pre-commit/pre-commit-hooks" [](#__codelineno-1-3)rev = "v6.0.0" [](#__codelineno-1-4)hooks = [   [](#__codelineno-1-5)  { id = "check-yaml" },  [](#__codelineno-1-6)  { id = "end-of-file-fixer" }, [](#__codelineno-1-7)]`

This configuration uses the `pre-commit-hooks` repository and enables two hooks: `check-yaml` validates YAML files, and `end-of-file-fixer` ensures every file ends with a newline.

Note

`prek.toml` is the native configuration file for **prek**. If you already have a `.pre-commit-config.yaml`, prek can still read it today.

Once you’re happy with your setup, you can stage the config file with `git add prek.toml`.

### 2\. Run hooks on demand[¶](#2-run-hooks-on-demand "Permanent link")

Use `prek run` to execute all configured hooks on the files in your current git staging area:

`[](#__codelineno-2-1)prek run`

Need to run a single hook? Pass its ID, for example `prek run check-yaml`. You can also target specific files with `--files`, or run against the entire repository with `--all-files`.

### 3\. Wire hooks into git automatically[¶](#3-wire-hooks-into-git-automatically "Permanent link")

To run the hooks every time you commit, install prek’s Git shim integration:

`[](#__codelineno-3-1)prek install`

Now every `git commit` will invoke `prek run` for the files included in the commit. If you ever want to undo this, run `prek uninstall`.

### 4\. Go further[¶](#4-go-further "Permanent link")

*   Explore richer configuration options in the official [pre-commit documentation](https://pre-commit.com/). Every example there works with prek.
*   See [Common Workflows](.././usage/) for the commands you will use after setup and how to handle hook failures.
*   Check the [configuration reference](.././reference/configuration/) for prek-specific settings.
*   Browse the [built-in hooks](.././builtin/) and the [difference guide](.././diff/) to see what else you can leverage.

That’s it! You now have automated checks running locally with minimal setup. When you’re ready to dive deeper, the rest of the docs cover advanced workflows, language-specific installers, and more.

Back to top

[

Previous

Installation



](../installation/)[

Next

Common Workflows

](../usage/)

Copyright © 2026 j178

Made with [Zensical](https://zensical.org/)