# Dark Glass

Dark Glass is an Omarchy theme built around one idea: neutral obsidian surfaces with blur, thin borders, and just enough contrast to keep the desktop readable.

Built for **Omarchy v4 (Quattro)**.

## Design Rules

- Wallpaper-led glass surfaces instead of flat panels
- Neutral monochrome UI with muted terminal syntax colors
- Thin white borders and restrained hover or selection states
- Warm color reserved for alerts, checks, and thermal states

## Included Components

- `colors.toml` — the central palette; drives the shell (bar, launcher,
  notifications, OSD), and any app not listed below via Omarchy's built-in
  templates (Foot, Chromium, Helix, Claude, VS Code fallback theme, etc.)
- `hyprland.lua` — window decoration, blur, opacity, shadow, and animation
  rules (Hyprland's Lua config API)
- `shell.lock.toml` — lock screen palette
- Kitty, Ghostty, Alacritty, `btop`, Warp, and Neovim theme files
- `vscode.json`, `icons.theme`

## Installation

This theme isn't published as its own git repo yet. Symlink it into your
user themes directory and activate it:

```bash
ln -s /path/to/this/repo ~/.config/omarchy/themes/dark-glass
omarchy theme set dark-glass
```

Once published to a git remote, it can instead be installed with:

```bash
omarchy theme install https://github.com/horazmic/omarchy-dark-glass.git
```

## Notes

- If you only want one surface, copy just that file into the matching app
  config under `~/.config/`.
- The theme is based on ideas from `omarchy-midnight-ronin`, then rebuilt around a lower-chroma glass system.
