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
    rounding = 10,

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
-- The rest of the menu layer (scrim disabled, shell.menu.toml scrim-alpha=0)
-- is fully transparent, so any ignore_alpha threshold above 0 already
-- excludes it from blur; keep this low so the card (background-alpha in
-- shell.menu.toml) always clears it even as that opacity gets tuned down.
hl.layer_rule({ match = { namespace = "omarchy-menu" }, blur = true, ignore_alpha = 0.1 })

-- Every regular window opts out of blur-behind entirely, even ones that
-- render their own client-side transparency (Alacritty/Kitty/Ghostty window
-- opacity). This keeps the blur pass scoped to the menu layer rule above
-- instead of showing through terminals and other apps.
hl.window_rule({ match = { class = ".*" }, no_blur = true })
