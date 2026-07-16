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
| `Is this the home Linux desktop?` | Enter `false` for macOS |

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
| `Is this the home Linux desktop?` | Enter `true` for the home desktop (`bluefin`) |

## Layout

```
.chezmoi.toml.tmpl              # prompts for email, signkey, isHomeDesktop
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
  executable_hyprland.sh
  executable_mise.sh.tmpl
  executable_prompt.sh
  executable_toolbox.sh
dot_config/
  environment.d/                # systemd user environment (Linux desktop only)
  homebrew/Brewfile.tmpl        # declarative brew + flatpak package list
  ghostty/                      # terminal config
  btop/                         # system monitor config
  tmux/                         # terminal multiplexer config
  nvim/                         # pulled via .chezmoiexternal.toml
  hypr/                         # Hyprland compositor config (Linux desktop only)
  waybar/                       # status bar config (Linux desktop only)
  mako/                         # notification daemon config (Linux desktop only)
  fuzzel/                       # app launcher config (Linux desktop only)
  pipewire/                     # audio config (Linux desktop only)
  wireplumber/                  # audio routing config (Linux desktop only)
  systemd/                      # user units (Linux desktop only)
  containers/                   # Podman Quadlets (Linux desktop only)
  ...
dot_gitconfig.tmpl
private_dot_gnupg/              # GPG agent config
private_dot_local/bin/          # custom shell scripts
  executable_menu.sh
  executable_powermenu.sh
  executable_toggle-gamemode.sh
  executable_toggle-idle.sh
  executable_toggle-scale.sh
  executable_toggle-tailscale.sh
```

## Useful aliases

- `get-ipv4` / `get-ipv6` — list all global-scope addresses across interfaces
- `atmux` — attach to or create a tmux session named `main`
- `wttr` — show weather for LHBP (Budapest Ferenc Liszt International Airport)
