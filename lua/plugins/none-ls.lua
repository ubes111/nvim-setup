return {
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")
			-- Asynchronous formatting function
			local async_formatting = function(bufnr)
				bufnr = bufnr or vim.api.nvim_get_current_buf()
				vim.lsp.buf_request(
					bufnr,
					"textDocument/formatting",
					vim.lsp.util.make_formatting_params({}),
					function(err, res, ctx)
						if err then
							local err_msg = type(err) == "string" and err or err.message
							vim.notify("formatting: " .. err_msg, vim.log.levels.WARN)
							return
						end

						-- Don't apply results if buffer is unloaded or has been modified
						if not vim.api.nvim_buf_is_loaded(bufnr) or vim.api.nvim_buf_get_option(bufnr, "modified") then
							return
						end

						if res then
							local client = vim.lsp.get_client_by_id(ctx.client_id)
							vim.lsp.util.apply_text_edits(res, bufnr, client and client.offset_encoding or "utf-16")
							vim.api.nvim_buf_call(bufnr, function()
								vim.cmd("silent noautocmd update")
							end)
						end
					end
				)
			end

			-- Create an augroup for formatting
			local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

			-- Setup null-ls with sources
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.black,
					null_ls.builtins.formatting.isort,
				},
				debug = false,
				on_attach = function(client, bufnr)
					if client.supports_method("textDocument/formatting") then
						vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
						vim.api.nvim_create_autocmd("BufWritePost", {
							group = augroup,
							buffer = bufnr,
							callback = function()
								async_formatting(bufnr)
							end,
						})
					end
				end,
			})

			-- Keymap for manual formatting
			vim.keymap.set("n", "<leader>gf", function()
				async_formatting()
			end, {})
		end,
	},
}
