# Dark Glass

Dark Glass is an Omarchy theme built around one idea: neutral obsidian surfaces with blur, thin borders, and just enough contrast to keep the desktop readable.

Built for **Omarchy v4 (Quattro)**.

## Design Rules

- Wallpaper-led frosted surfaces instead of flat panels
- Neutral monochrome UI with muted terminal syntax colors
- Thin white borders and restrained hover or selection states
- Warm color reserved for alerts, checks, and thermal states

## Included Components

- `colors.toml` — the central palette; drives Omarchy's generated app themes
  (Foot, Chromium, Helix, Claude, VS Code fallback theme, and more)
- `hyprland.lua` — window decoration, shadows, animation, and targeted blur
  for Omarchy shell cards. Ordinary app windows remain unblurred.
- `shell.menu.toml` — application menu, clipboard, emoji, and reminder glass
  surface
- `shell.popups.toml`, `shell.tooltip.toml`, `shell.notifications.toml` —
  status panels, tooltips, and notifications
- `shell.controls.toml` — common hover, focus, selection, and pressed states
- `shell.polkit.toml`, `shell.lock.toml`, `shell.image-picker.toml` —
  authentication, lock-field, and background/theme-picker styling
- Kitty, Ghostty, Alacritty, `btop`, and Neovim theme files
- `vscode.json`, `icons.theme`
- Ten bundled high-resolution wallpapers in `backgrounds/`, plus preview
  assets for theme browsers and the lock screen

## Runtime Extensions

Two optional user-owned plugin overrides complement this theme and survive
Omarchy updates:

- `~/.config/omarchy/plugins/horazmic.lock` — lock-screen wallpaper blur
- `~/.config/omarchy/plugins/horazmic.osd` — frosted volume and brightness OSD

They are local configuration, not files in this theme repository. The theme
remains fully usable without them; Omarchy's built-in lock screen and OSD are
used instead.

## Installation

This theme is not yet published to a remote repository. Symlink the local
checkout into your user themes directory and activate it:

```bash
ln -s /path/to/this/repo ~/.config/omarchy/themes/dark-glass
omarchy theme set dark-glass
```

Once published to a git remote, it can instead be installed with:

```bash
omarchy theme install https://github.com/horazmic/omarchy-dark-glass.git
```

## Notes

- Terminal, editor, and `btop` files can be copied into their matching app
  configuration. `shell.*.toml` files are Omarchy theme-section overrides and
  should remain in the theme directory.
- The theme is based on ideas from `omarchy-midnight-ronin`, then rebuilt around a lower-chroma glass system.
