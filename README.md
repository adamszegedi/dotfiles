# dotfiles

Personal [chezmoi](https://www.chezmoi.io/) source directory.

## Prerequisites

Install these system packages via your distro package manager before running `chezmoi init`:

| Package | Purpose |
| ------- | ------- |
| `openssh` | Provides the `ssh-agent.socket` systemd user unit (enabled on first apply) |

Then install these tools:

| Tool | Purpose | Install |
| ---- | ------- | ------- |
| [Homebrew](https://brew.sh) | Package manager (CLI tools + flatpaks) | `curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh \| bash` |
| [rustup](https://rustup.rs) | Rust toolchain manager | `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs \| sh` |
| [mise](https://mise.jdx.dev) | Runtime version manager | `curl https://mise.run \| sh` |

## Bootstrap on a new machine

```sh
# 1. Install chezmoi
brew install chezmoi

# 2. Initialize from this repo and apply
chezmoi init --apply git@github.com:adamszegedi/dotfiles.git
```

On first apply, chezmoi will prompt once for:

| Prompt  | Purpose                 |
| ------- | ----------------------- |
| `email` | Git commit author email |

The answer is saved in `~/.config/chezmoi/chezmoi.toml` and reused on every subsequent `chezmoi apply`.

## Layout

```
.chezmoi.toml.tmpl              # prompt + data setup
.chezmoiignore              # static ignore list
.chezmoiexternal.toml       # pulls ~/.config/nvim from a separate repo
dot_bash_profile
dot_bashrc
dot_bashrc.d/               # per-concern rc fragments (one file per tool)
  executable_hyprland.sh    # launches Hyprland via uwsm on tty1
  executable_ssh-agent.sh   # exports SSH_AUTH_SOCK for the systemd socket
dot_config/
  environment.d/ssh-agent.conf  # sets SSH_AUTH_SOCK for systemd user sessions
  homebrew/Brewfile         # declarative brew + flatpak package list
  ghostty/                  # terminal config
  btop/                     # system monitor config
  tmux/                     # terminal multiplexer config
  nvim/                     # pulled via .chezmoiexternal.toml
  ...
dot_gitconfig.tmpl
private_dot_gnupg/
run_once_enable-ssh-agent-socket.sh  # enables ssh-agent.socket systemd user unit
```

## Useful aliases (from `dot_bashrc.d/executable_aliases.sh`)

- `get-ipv4` / `get-ipv6` — list all global-scope addresses across interfaces
- `atmux` — attach to or create a tmux session named `main`
- `wttr` — show weather for LHBP (Budapest Ferenc Liszt International Airport)
