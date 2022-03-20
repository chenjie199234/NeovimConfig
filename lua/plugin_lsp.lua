--lsp auto format on save
vim.cmd [[ au BufWritePre *.go,*.h,*.c,*.hh,*.cc,*.hpp,*.cpp,*.hxx,*.cxx lua vim.lsp.buf.formatting_sync() ]]
--diagnostic
vim.cmd [[ au VimEnter * lua vim.diagnostic.config({virtual_text = false}) ]]

--lsp setting
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local cmp = require('cmp')
local luasnip = require('luasnip')
cmp.setup({
	enabled = true,
	--preselect = cmp.PreselectMode.Item,
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
		['<C-j>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				return cmp.select_next_item()
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
			if luasnip.expand_or_jumpable() then
				return luasnip.expand_or_jump()
			elseif cmp.visible() then
				if cmp.complete_common_string() then
					return
				end
				return cmp.select_next_item()
			elseif has_words_before() then
				cmp.complete()
			end
			fallback()
		end,{'i'}),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if luasnip.expand_or_jumpable() then
				return luasnip.expand_or_jumpable()
			elseif cmp.visible() then
				if cmp.complete_common_string() then
					return
				end
				return cmp.select_prev_item()
			elseif has_words_before() then
				cmp.complete()
			end
			fallback()
		end,{'i'})
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
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require('lspconfig')['gopls'].setup {capabilities = capabilities}
require('lspconfig')['clangd'].setup {capabilities = capabilities}
