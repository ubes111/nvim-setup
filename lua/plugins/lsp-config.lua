return {
    {
        "williamboman/mason.nvim",
        config = function ()
            require('mason').setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function ()
            require('mason-lspconfig').setup({
                ensure_installed = { 'lua_ls', 'pyright', 'rust_analyzer', 'jsonls'}
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function ()
            local lspconfig = require('lspconfig')
            lspconfig.lua_ls.setup({})
            lspconfig.pyright.setup({})
            lspconfig.rust_analyzer.setup({})
            lspconfig.jsonls.setup({})
            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action,{})
        end
    }
}

