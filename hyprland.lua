-- Dark Glass: obsidian borders, blur, and soft motion
local active_border_color = "rgba(ffffff55)"
local inactive_border_color = "rgba(ffffff18)"

hl.config({
  general = {
    gaps_in = 2,
    gaps_out = 4,
    border_size = 1,

    col = {
      active_border = active_border_color,
      inactive_border = inactive_border_color,
    },

    layout = "dwindle",
  },

  decoration = {
    rounding = 20,

    -- Fully opaque windows: blur-behind only triggers on transparent
    -- surfaces, so this keeps the blur pass scoped to the omarchy-menu
    -- layer rule below instead of showing through every window.
    active_opacity = 1.0,
    inactive_opacity = 1.0,

    blur = {
      enabled = true,
      size = 10,
      passes = 4,
      ignore_opacity = true,
      new_optimizations = true,
    },

    shadow = {
      enabled = true,
      range = 15,
      render_power = 3,
      color = "rgba(00000055)",
    },
  },

  group = {
    col = {
      border_active = active_border_color,
      border_inactive = inactive_border_color,
    },
  },

  animations = {
    enabled = true,
  },
})

hl.animation({ leaf = "windows", enabled = true, speed = 2, bezier = "default" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 2, bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "windowsMove", enabled = true, speed = 2, bezier = "default" })
hl.animation({ leaf = "border", enabled = true, speed = 2, bezier = "default" })
hl.animation({ leaf = "fade", enabled = true, speed = 3, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 2, bezier = "default", style = "slide" })

-- Blur the app launcher / menu card so it reads as glass, not a flat panel.
-- Layer-shell surfaces aren't blurred by decoration.blur alone; they need
-- an explicit layer rule naming their namespace.
-- The rest of the menu layer uses a minimal 0.06 scrim, which remains below
-- the threshold. Keep it low so the card (background-alpha in
-- shell.menu.toml) always clears it even as that opacity gets tuned down.
hl.layer_rule({ match = { namespace = "omarchy-menu" }, blur = true, ignore_alpha = 0.1 })

-- Bar widgets open as child popup surfaces rather than independent named
-- layers. Blur them through their owning bar layer; the alpha threshold keeps
-- the transparent bar itself out of the blur pass while its glass popouts
-- receive the same treatment as the launcher.
hl.layer_rule({ match = { namespace = "omarchy-bar" }, blur = true, blur_popups = true, ignore_alpha = 0.1 })

-- The interactive status panels (audio, network, Bluetooth, power, etc.)
-- share a full-screen layer-shell container. Its card is the only opaque
-- region; ignore the transparent dismiss area and blur the card itself.
hl.layer_rule({ match = { namespace = "omarchy-keyboard-panel" }, blur = true, ignore_alpha = 0.1 })

-- Polkit uses a 0.14 full-screen scrim behind a 0.78 dialog card. Ignore the
-- scrim so blur is confined to the authentication popup itself.
hl.layer_rule({ match = { namespace = "omarchy-polkit" }, blur = true, ignore_alpha = 0.5 })

-- Remaining Omarchy overlay surfaces share the same frosted treatment. These
-- are explicit layer-shell namespaces, so application windows stay untouched.
for _, namespace in ipairs({
  "omarchy-notifications",
  "omarchy-osd",
  "omarchy-clipboard",
  "omarchy-emojis",
  "omarchy-reminders",
  "omarchy-network-qr",
  "omarchy-speed-test",
  "omarchy-network-speedtest",
  "omarchy-disk-speedtest",
  "omarchy-lock-preview",
}) do
  hl.layer_rule({ match = { namespace = namespace }, blur = true, ignore_alpha = 0.1 })
end

-- Every regular window opts out of blur-behind entirely, even ones that
-- render their own client-side transparency (Alacritty/Kitty/Ghostty window
-- opacity). This keeps the blur pass scoped to the menu layer rule above
-- instead of showing through terminals and other apps.
hl.window_rule({ match = { class = ".*" }, no_blur = true })
