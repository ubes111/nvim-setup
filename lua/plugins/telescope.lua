return {
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function ()
            local builtin = require("telescope.builtin")
            local actions = require("telescope.actions")
            local telescope = require("telescope")

            telescope.setup {
                defaults = {
                    mappings = {
                        i = {
                            ["<C-y>"] = actions.select_vertical,  -- Change to <C-x>
                        },
                        n = {
                            ["<C-y>"] = actions.select_vertical,  -- Change to <C-x>
                        },
                    }
                }
            }
            vim.keymap.set('n', '<C-p>', builtin.find_files, { noremap = true, silent = true })
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        end
    },
    {
        'nvim-telescope/telescope-ui-select.nvim',
        config = function ()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
        },
}
