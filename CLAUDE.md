# CLAUDE.md

Personal dotfiles for macOS (primary) and Linux (secondary), managed with GNU Stow
and a single `run` script. No build, no test suite.

## Layout

- `home/` mirrors `$HOME`. Stow symlinks it: `stow -R -d . -t ~ home`. A new file
  under `home/` lands in `$HOME` on the next `./run stow`.
- `Brewfile` — every package, installed by `brew bundle` in `run init`.
- `run` — the only entry point. Commands: `init`, `stow`, `update`, `doctor`, `help`.

## Conventions

**Platform guards.** Decide by the package's role, not by `brew` vs `cask`. A
formula that builds on Linux still belongs in `if OS.mac?` when Linux has a
native equivalent (colima: the Docker engine is native there). Mirror the guard
wherever the package is used — `[[ "$(uname -s)" == "Darwin" ]]` in `run`,
`if test (uname) = Darwin` in fish config. A guard in one place and not the
other is a bug.

**init and doctor stay in sync.** Anything `init` installs or starts, `doctor`
checks. `doctor` counts issues and reports; it never fixes.

**Non-fatal steps.** `run` uses `set -euo pipefail`, so a step that may legitimately
fail must warn and `return 0` rather than abort the rest of `init`. Use the
`print_success` / `print_warning` / `print_error` / `print_info` helpers and
`command_exists`, never bare `echo`.

**Comments explain why.** The existing ones document reasons a reader cannot
recover from the code: why GNU `stat` is tried before BSD, why `fish -c` must
activate nvm before calling `npx`, why resource flags only matter on Colima's
first start.
Match that density. Skip comments that restate the line.

**Don't vendor upstream-owned files.** The herdr hook and the agent skills are
versioned elsewhere; `run init` installs them with idempotent commands instead
of keeping copies that go stale. Skills come only from the `huy-skills` Claude
Code plugin marketplace (`quanghuynt14/skills`); nothing installs into
`~/.claude/skills` or `~/.agents/skills`.

**Fish config.** One file per tool in `conf.d`, named after it. `config.fish`
stays minimal. Plugins live in `fish_plugins`, managed by fisher.

## Working tree

`~/.config` is a symlink into this repo (stow folded the whole directory), so
every tool that writes under `~/.config` writes *here*: logs, sockets, session
state, caches, credentials. Nothing distinguishes those from real config except
intent.

So `.gitignore` is an allowlist, not a denylist: `home/**` ignores everything,
and each tracked file has its own `!` line. A new tool's files are invisible to
`git status` and refused by `git add` until someone writes a line for them.
This fails closed — the reverse, adding an ignore rule per tool, only protects
against the tools you already know about.

**Adding a config file therefore takes two steps:** write it under `home/`, then
add its `!` line to `.gitignore`. There is no other way to track it, by design.
Files owned by someone else — fisher plugin output, an installer's commands,
runtime state — get no line at all.

## Checks before committing

```sh
bash -n run                              # run script syntax
fish -n home/.config/fish/conf.d/x.fish  # fish syntax
brew bundle check --file=Brewfile        # Brewfile resolves
./run doctor                             # full diagnostic
```

Commits are SSH-signed (`~/.ssh/id_ed25519.pub`) and land on `main`.
