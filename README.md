# dotfiles

Personal [chezmoi](https://www.chezmoi.io/) source directory for Arch Linux + Hyprland.

## Bootstrap on a new machine

```sh
# 1. Install chezmoi
sudo pacman -S chezmoi

# 2. Initialize from this repo and apply
chezmoi init --apply git@github.com:adamszegedi/dotfiles.git
```

On first apply, chezmoi will prompt once for:

| Prompt     | Purpose                                          |
| ---------- | ------------------------------------------------ |
| `hosttype` | `desktop` or `work` — gates desktop-only configs |
| `email`    | Git commit author email                          |

Answers are saved in `~/.config/chezmoi/chezmoi.toml` and reused on every subsequent `chezmoi apply`.

On first apply (and any time `.chezmoidata/packages.yaml` changes), chezmoi runs `run_onchange_install-packages.sh.tmpl`, which installs the pacman packages declared in that file — and, on `hosttype = desktop`, adds the Flathub remote and installs the declared flatpak apps. You'll be prompted for `sudo` for the pacman step.

## Layout

```
.chezmoi.toml.tmpl                       # prompt + data setup
.chezmoidata/packages.yaml               # declarative pacman + flatpak list
.chezmoiignore                           # host-gated ignore list (non-desktop skips GUI configs)
.chezmoiexternal.toml                    # pulls ~/.config/nvim from a separate repo
run_onchange_install-packages.sh.tmpl    # re-runs whenever packages.yaml changes
dot_bashrc.tmpl                          # ~/.bashrc; Hyprland auto-launch gated on hosttype
dot_bashrc.d/                            # per-concern rc fragments (one file per tool)
dot_config/                              # ~/.config (hypr, waybar, ghostty, btop, tmux, ...)
dot_gitconfig.tmpl
private_dot_gnupg/
private_dot_local/bin/                   # toggle-* helpers + update.sh
```

## Host types

- **desktop** — full Hyprland/Waybar/Ghostty stack
- **work** — everything under `.config/{hypr,waybar,ghostty,mako,mpv,pipewire,wireplumber,fuzzel,containers,systemd}` and `.local/bin` is ignored (see `.chezmoiignore`)

## Useful aliases (from `dot_bashrc.d/executable_aliases.sh`)

- `dotcheck` — run `shellcheck` over every `.sh` in the chezmoi source tree
- `get-ipv4` / `get-ipv6` — list all global-scope addresses across interfaces
- `atmux` — attach to or create a tmux session named `main`

## Updating everything

`~/.local/bin/update.sh` runs pacman, flatpak, mise, `chezmoi update` (which pulls this repo + externals and re-applies), and a headless `:Lazy restore` for Neovim.
