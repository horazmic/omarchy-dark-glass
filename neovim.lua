return {
    {
        "bjarneo/aether.nvim",
        name = "aether",
        priority = 1000,
        opts = {
            disable_italics = false,
            colors = {
                -- Obsidian glass neutrals
                base00 = "#0d0d0d",
                base01 = "#151515",
                base02 = "#2a2a2a",
                base03 = "#4a4a4a",
                base04 = "#7d7d7d",
                base05 = "#f2f2f2",
                base06 = "#ffffff",
                base07 = "#d0d0d0",

                -- Muted syntax accents
                base08 = "#b88a8a",
                base09 = "#b89778",
                base0A = "#b8a27f",
                base0B = "#93a389",
                base0C = "#89a3a0",
                base0D = "#8c99a6",
                base0E = "#a18ea6",
                base0F = "#9f9f9f",
            },
        },
        config = function(_, opts)
            require("aether").setup(opts)

            -- Keep editing surfaces transparent so Hyprland blur remains visible.
            vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
            vim.api.nvim_set_hl(0, "MsgArea", { bg = "none" })
        end,
    },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "aether",
        },
    },
}
