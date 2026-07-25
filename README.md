# dotfiles

Personal [chezmoi](https://www.chezmoi.io/) source directory.

## Bootstrap

### macOS

Install the prerequisite tools:

| Tool | Purpose | Install |
| ---- | ------- | ------- |
| [Homebrew](https://brew.sh) | Package manager | `curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh \| bash` |
| [rustup](https://rustup.rs) | Rust toolchain manager | `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \| sh` |
| [mise](https://mise.jdx.dev) | Runtime version manager | `curl https://mise.run \| sh` |

Then initialise chezmoi:

```sh
brew install chezmoi
chezmoi init --apply git@github.com:adamszegedi/dotfiles.git
```

On first apply, chezmoi will prompt once for:

| Prompt | Purpose |
| ------ | ------- |
| `Email address` | Git commit author email |
| `GPG signing key` | Key ID used for signed commits |

### Linux

Install the prerequisite system package before running chezmoi:

| Package | Purpose |
| ------- | ------- |
| `openssh` | Provides the `ssh-agent.socket` systemd user unit |

Then install the prerequisite tools:

| Tool | Purpose | Install |
| ---- | ------- | ------- |
| [Homebrew](https://brew.sh) | Package manager | `curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh \| bash` |
| [rustup](https://rustup.rs) | Rust toolchain manager | `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \| sh` |
| [mise](https://mise.jdx.dev) | Runtime version manager | `curl https://mise.run \| sh` |

Then initialise chezmoi:

```sh
brew install chezmoi
chezmoi init --apply git@github.com:adamszegedi/dotfiles.git
```

On first apply, chezmoi will prompt once for:

| Prompt | Purpose |
| ------ | ------- |
| `Email address` | Git commit author email |
| `GPG signing key` | Key ID used for signed commits |

## Environments

These configs target three machines. Which machine is which is detected
automatically — no prompts beyond email/signing key:

| Environment | `.chezmoi.os` | `isWSL` | Notes |
| ----------- | ------------- | ------- | ----- |
| macOS | `darwin` | `false` | Homebrew (Apple Silicon), no systemd/Wayland/desktop units |
| Bluefin desktop | `linux` | `false` | Full GNOME/Wayland desktop: PipeWire, WirePlumber, Podman quadlets, systemd user units, ghostty |
| WSL workspace | `linux` | `true` | Shell-only Linux: uses `clip.exe` for tmux clipboard, software-only GPG (no scdaemon), skips desktop/GUI-only config |

`isWSL` is auto-derived in `.chezmoi.toml.tmpl` by checking for `microsoft` in
`/proc/sys/kernel/osrelease`. Desktop/GUI-only files are gated with
`eq .chezmoi.os "darwin"` / `.isWSL` in the `.chezmoiignore` files.

## Layout

```
.chezmoi.toml.tmpl              # prompts for email, signkey; auto-detects isWSL
.chezmoiignore                  # OS/desktop-conditional ignore rules
.chezmoiexternal.toml           # pulls ~/.config/nvim from a separate repo
dot_bash_profile
dot_bashrc
dot_bashrc.d/                   # per-concern rc fragments (one file per tool)
  executable_aliases.sh.tmpl
  executable_brew.sh.tmpl
  executable_cargo.sh
  executable_environment_variables.sh
  executable_gpg.sh
  executable_macports.sh          # MacPorts PATH (macOS only)
  executable_mise.sh.tmpl
  executable_prompt.sh
  executable_toolbox.sh
dot_config/
  environment.d/                # systemd user environment (Linux desktop only)
  homebrew/Brewfile.tmpl        # declarative brew + flatpak package list
  ghostty/                      # terminal config
  btop/                         # system monitor config
  bat/                          # syntax-highlighting cat config
  tmux/                         # terminal multiplexer config
  mpv/                          # media player config
  nvim/                         # pulled via .chezmoiexternal.toml
  tealdeer/                     # tldr client config
  pipewire/                     # audio config (Linux desktop only)
  wireplumber/                  # audio routing config (Linux desktop only)
  systemd/                      # user units (Linux desktop only)
  containers/                   # Podman Quadlets (Linux desktop only)
  ...
dot_gitconfig.tmpl
private_dot_gnupg/              # GPG agent config

```

## Useful aliases

- `get-ipv4` / `get-ipv6` — list all global-scope addresses across interfaces
- `atmux` — attach to or create a tmux session named `main`
- `wttr` — show weather for LHBP (Budapest Ferenc Liszt International Airport)
