--lsp auto format on save
vim.cmd [[ au BufWritePre *.go,*.h,*.c,*.hh,*.cc,*.hpp,*.cpp,*.hxx,*.cxx lua vim.lsp.buf.formatting_sync() ]]
--diagnostic
vim.cmd [[ au VimEnter * lua vim.diagnostic.config({virtual_text = false}) ]]

--lsp setting
local cmp = require('cmp')
local luasnip = require('luasnip')
cmp.setup({
	enabled = true,
	preselect = cmp.PreselectMode.None,
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = {
		['<CR>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm({select = false})
				if cmp.visible() then
					cmp.close()
				end
				return
			end
			fallback()
		end,{'i','c'}),
		['<Down>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				return cmp.select_next_item()
			end
			fallback()
		end,{'i','c'}),
		['<C-j>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				return cmp.select_next_item()
			end
			fallback()
		end,{'i','c'}),
		['<Up>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				return cmp.select_prev_item()
			end
			fallback()
		end,{'i','c'}),
		['<C-k>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				return cmp.select_prev_item()
			end
			fallback()
		end,{'i','c'}),
		['<Tab>'] = cmp.mapping(function(fallback)
			if has_words_before() then
				if luasnip.expandable() then
					return luasnip.expand()
				elseif luasnip.in_snippet() and luasnip.jumpable(1) then
					return luasnip.jump(1)
				elseif cmp.visible() then
					if cmp.complete_common_string() then
                                               return
                                        end
					return cmp.select_next_item()
				else
					cmp.complete()
				end
			end
			fallback()
		end,{'i','c'}),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if has_words_before() then
				if luasnip.expandable() then
					return luasnip.expand()
				elseif luasnip.in_snippet() and luasnip.jumpable(1) then
					return luasnip.jump(1)
				elseif cmp.visible() then
					if cmp.complete_common_string() then
                                               return
                                        end
					return cmp.select_prev_item()
				else
					cmp.complete()
				end
			end
			fallback()
		end,{'i','c'})
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' },
	})
})
cmp.setup.cmdline('/', {
	sources = {
		{ name = 'buffer' }
	}
})
cmp.setup.cmdline(':', {
	sources = cmp.config.sources({
        	{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

--vscode snippets
require("luasnip.loaders.from_vscode").lazy_load()

--start lsp server
local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')['gopls'].setup {capabilities = capabilities}
require('lspconfig')['clangd'].setup {capabilities = capabilities}
