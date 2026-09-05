# AGENTS.md

Personal [chezmoi](https://www.chezmoi.io/) dotfiles source directory targeting three machines. There is no build, test, lint, or CI — this repo only holds chezmoi-managed config.

## Chezmoi naming rules (easy to break)

- Source paths use chezmoi attributes, not literal target paths: `dot_` → `~/.`, `private_dot_` → private target (e.g. `private_dot_gnupg/` → `~/.gnupg/`), `executable_` prefix marks the target executable.
- `.tmpl` files are Go templates rendered with data from `.chezmoi.toml.tmpl`. Available vars: `.chezmoi.os` (`darwin`/`linux`), `.isWSL` (bool), `.email`, `.signkey`. Files without `.tmpl` are copied verbatim.
- Do **not** create `dot_config/nvim/` — the neovim config is pulled from a separate repo via `.chezmoiexternal.toml`.

## Environment detection

Three targets are auto-detected (no prompts beyond email/signing key on first apply):

| Environment | `.chezmoi.os` | `.isWSL` |
| ----------- | ------------- | -------- |
| macOS (Apple Silicon) | `darwin` | `false` |
| Bluefin desktop (GNOME/Wayland) | `linux` | `false` |
| WSL (shell-only) | `linux` | `true` |

OS/desktop-conditional files are gated through **nested** `.chezmoiignore` files, not just the root one:
- `dot_config/.chezmoiignore` — gates GUI-only dirs (`ghostty`, `linearmouse`, `containers`, `pipewire`, `wireplumber`, `systemd`, `mimeapps.list`, `environment.d/*`)
- `dot_bashrc.d/.chezmoiignore` — drops `macports.sh` on linux
- `dot_config/systemd/user/.chezmoiignore` — ignores `*.target.wants/`

When adding a desktop/GUI-only or OS-specific file, add the corresponding ignore rule.

## Commands

- Apply/verify: `chezmoi apply` (renders templates, installs to targets).
- Render one template without applying: `chezmoi execute-template < file.tmpl` or `chezmoi diff`.
- Auto-commit/push is **off** (`git.autoCommit`/`autoPush = false` in `.chezmoi.toml.tmpl`). `chezmoi apply` / `chezmoi edit` do NOT commit; you must `git add`/`commit`/`push` manually. Prefer `chezmoi edit` for real edits (handles source→target naming); direct file edits here only change the source until applied.
- Update external repos: `chezmoi update` (refreshes the nvim external, refreshPeriod 168h).

## Conventions

- `dot_bashrc.d/` holds one `executable_*.sh[.tmpl]` fragment per tool; `dot_bashrc` glob-sources `~/.bashrc.d/*`, so no registration is needed — just drop a file in. Bash fragments carry `# shellcheck shell=bash` and use `{{- ... }}` templates to branch on OS.
- `dot_config/homebrew/Brewfile.tmpl` is the single declarative package list (brew + cask + flatpak). On linux, flatpaks are inside `{{ if eq .chezmoi.os "linux" }}`.
- Templates use `{{-`/`-}}` trimming; preserve the surrounding whitespace semantics when editing.
- Secrets (`*.pem`, `*.key`, `.env`) are gitignored; GPG config is the only private content (`private_dot_gnupg/`).
