return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        views = {
            mini = {
                win_options = {
                    winblend = 0, -- Set winblend to 0 for the mini view
                },
            },
        },
        -- Add any additional Noice options here if needed
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
    config = function(_, opts)
        -- Setup for Noice
        require("noice").setup(opts)

        -- Setup for nvim-notify, only setting background_colour to avoid transparency issue
        require('notify').setup({
            background_colour = "#000000" -- Set background color to fix transparency issue
        })

        -- Route Noice notifications to nvim-notify
        vim.notify = require("notify")
    end,
}
