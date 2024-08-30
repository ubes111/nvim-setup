return {
    "catppuccin/nvim", 
    name = "catppuccin", 
    priority = 1000,
    config = function()
        require("catppuccin").setup({
            transparent_background = true,
            custom_highlights = function(colors)
                return {
                    Folded = { bg = colors.none },
                }
            end,
        })
        vim.cmd("colorscheme catppuccin")
    end,
}
