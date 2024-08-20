function close_all_float_window()
	for _, win in ipairs(vim.api.nvim_list_wins()) do
		local config = vim.api.nvim_win_get_config(win)
		if config.relative ~= "" then
			vim.api.nvim_win_close(win, false)
		end
	end
end

function has_words_before()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

vim.api.nvim_set_keymap('n','<ESC>',':lua close_all_float_window()<CR>:cclose<CR><ESC>',{silent = true,noremap = true})

--window
vim.api.nvim_set_keymap('n','wj','<C-w>j',{silent = true})
vim.api.nvim_set_keymap('n','wk','<C-w>k',{silent = true})
vim.api.nvim_set_keymap('n','wh','<C-w>h',{silent = true})
vim.api.nvim_set_keymap('n','wl','<C-w>l',{silent = true})

--terminal
vim.api.nvim_set_keymap('n','tt',':bo split +terminal<CR>a',{silent = true})

--save and quit
vim.api.nvim_set_keymap('n','ww',':w!<CR>',{silent = true})
vim.api.nvim_set_keymap('n','wq',':wq!<CR>',{silent = true})
vim.api.nvim_set_keymap('n','qq',':q!<CR>',{silent = true})

--del and copy
vim.api.nvim_set_keymap('n','dh','d^',{silent = true})
vim.api.nvim_set_keymap('n','dl','d$',{silent = true})
vim.api.nvim_set_keymap('n','yh','y^',{silent = true})
vim.api.nvim_set_keymap('n','yl','y$',{silent = true})

--normal navigation
vim.api.nvim_set_keymap('n','<C-h>','^',{silent = true})
vim.api.nvim_set_keymap('n','<C-l>','$',{silent = true})
vim.api.nvim_set_keymap('n','<M-h>','^',{silent = true})
vim.api.nvim_set_keymap('n','<M-l>','$',{silent = true})
vim.api.nvim_set_keymap('n','<C-j>','<C-f>',{silent = true})
vim.api.nvim_set_keymap('n','<C-k>','<C-b>',{silent = true})
vim.api.nvim_set_keymap('n','<M-j>','<C-f>',{silent = true})
vim.api.nvim_set_keymap('n','<M-k>','<C-b>',{silent = true})

vim.api.nvim_set_keymap('n','H','v<gv<ESC>',{silent = true})
vim.api.nvim_set_keymap('v','H','<gv',{silent = true})
vim.api.nvim_set_keymap('n','L','v>gv<ESC>',{silent = true})
vim.api.nvim_set_keymap('v','L','>gv',{silent = true})
vim.api.nvim_set_keymap('n','<M-v>','V',{silent = true})
vim.api.nvim_set_keymap('v','<M-v>','V',{silent = true})

--insert navigation
vim.api.nvim_set_keymap('i','<C-j>','<Down>',{silent = true})
vim.api.nvim_set_keymap('i','<M-j>','<Down>',{silent = true})
vim.api.nvim_set_keymap('i','<C-k>','<Up>',{silent = true})
vim.api.nvim_set_keymap('i','<M-k>','<Up>',{silent = true})
vim.api.nvim_set_keymap('i','<C-h>','<Left>',{silent = true})
vim.api.nvim_set_keymap('i','<M-h>','<Left>',{silent = true})
vim.api.nvim_set_keymap('i','<C-l>','<Right>',{silent = true})
vim.api.nvim_set_keymap('i','<M-l>','<Right>',{silent = true})

--command navigation
vim.api.nvim_set_keymap('c','<C-j>','<Down>',{silent = true})
vim.api.nvim_set_keymap('c','<M-j>','<Down>',{silent = true})
vim.api.nvim_set_keymap('c','<C-k>','<Up>',{silent = true})
vim.api.nvim_set_keymap('c','<M-k>','<Up>',{silent = true})
vim.api.nvim_set_keymap('c','<C-h>','<Left>',{silent = true})
vim.api.nvim_set_keymap('c','<M-h>','<Left>',{silent = true})
vim.api.nvim_set_keymap('c','<C-l>','<Right>',{silent = true})
vim.api.nvim_set_keymap('c','<M-l>','<Right>',{silent = true})
vim.api.nvim_set_keymap('c','<C-p>','<C-r>+',{silent = true})
vim.api.nvim_set_keymap('c','<M-p>','<C-r>+',{silent = true})

--buffer navigation
vim.api.nvim_set_keymap('n','n',':bn<CR>',{silent = true,noremap = true})
vim.api.nvim_set_keymap('n','b',':bp<CR>',{silent = true})
vim.api.nvim_set_keymap('n','m',':bd<CR>',{silent = true})

--undo and redo
vim.api.nvim_set_keymap('n','u','u',{silent = true})
vim.api.nvim_set_keymap('n','U','U',{silent = true})
vim.api.nvim_set_keymap('n','<C-u>','U',{silent = true})
vim.api.nvim_set_keymap('n','<M-u>','U',{silent = true})

--search
vim.api.nvim_set_keymap('n',',','searchcount().total > 0 ? "N" : ":lua vim.diagnostic.goto_prev()<CR>"',{silent = true,noremap = true,expr = true})
vim.api.nvim_set_keymap('n','.','searchcount().total > 0 ? "n" : ":lua vim.diagnostic.goto_next()<CR>"' ,{silent = true,noremap = true,expr = true})

--lsp hover
vim.api.nvim_set_keymap('n','`',':lua vim.lsp.buf.hover()<CR>',{silent = true})
vim.api.nvim_set_keymap('v','`',':lua vim.lsp.buf.hover()<CR>',{silent = true})

--fold
vim.api.nvim_set_keymap('n','<Space>',[[ foldclosed(line(".")) < 0 && foldlevel(line(".")) > 0 ? 'zc' : 'zo' ]],{silent = true,noremap = true,expr = true})
vim.api.nvim_set_keymap('v','<Space>',[[ foldclosed(line(".")) < 0 && foldlevel(line(".")) > 0 ? '<ESC>zc' : '<ESC>zo' ]],{silent = true,noremap = true,expr = true})
	
--diagnostic
-- vim.api.nvim_set_keymap('n','<Space>',':lua vim.diagnostic.open_float({focus = false})<CR>',{silent = true})

--reference
vim.api.nvim_set_keymap('n',[[']],':lua vim.lsp.buf.references()<CR>',{silent = true})

--lsp rename
vim.api.nvim_set_keymap('n','<C-r>',':lua vim.lsp.buf.rename()<CR>',{silent = true})
vim.api.nvim_set_keymap('n','<M-r>',':lua vim.lsp.buf.rename()<CR>',{silent = true})

--lsp definition
vim.api.nvim_set_keymap('n','<C-i>',':lua vim.lsp.buf.definition()<CR>',{silent = true})
vim.api.nvim_set_keymap('n','<M-i>',':lua vim.lsp.buf.definition()<CR>',{silent = true})
--<C-o> jump back to last cursor position
vim.api.nvim_set_keymap('n','<M-o>','<C-o>',{silent = true})

--lsp format
vim.api.nvim_create_autocmd({"BufWritePre"},{pattern={"*.go","*.h","*.c","*.hh","*.cc","*.hpp","*.cpp","*.hxx","*.cxx"},callback=function()vim.lsp.buf.format({async = false});end})

--nvim tree
vim.api.nvim_create_autocmd({"VimEnter"},{callback=function(data)
  require("nvim-tree.api").tree.toggle()
  if vim.fn.filereadable(data.file) and data.file~="" then
    require("nvim-tree.api").tree.toggle()
  end
end})

vim.opt.shortmess="I"
vim.opt.splitright=true
vim.opt.clipboard:append("unnamedplus")
vim.opt.mouse="a"
vim.opt.backup=false
vim.opt.writebackup=false
vim.opt.swapfile=false
vim.opt.number=true
vim.opt.whichwrap="h,l"
vim.opt.ignorecase=true
vim.opt.smartcase=true
vim.opt.cursorline=true
vim.opt.foldmethod="indent"
vim.opt.foldlevel=1

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  -- My plugins here
  -- indent
  {
    "lukas-reineke/indent-blankline.nvim",
    main="ibl",
    opts={
      indent={char="┋"}
    },
  },
  -- color
  {
    "Tsuzat/NeoSolarized.nvim",
    init = function()
      vim.cmd [[ colorscheme NeoSolarized ]]
    end,
    lazy=false,
  },
  {
    'uga-rosa/ccc.nvim',
    init = function()
      vim.api.nvim_set_keymap('n','##',':CccPick<CR>',{silent = true})
      vim.api.nvim_set_keymap('v','##','<ESC>:CccPick<CR>',{silent = true})
      vim.api.nvim_set_keymap('i','##','<ESC>:CccPick<CR>',{silent = true})
    end,
    opts={
      highlighter={auto_enable=true},
    },
    lazy=false,
  },
  -- statusline
  {
    'nvim-lualine/lualine.nvim',
    opts={
      options = {
        icons_enabled=false,
        theme='NeoSolarized',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
        always_divide_middle = true,
      },
      sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diagnostics'},
        lualine_c = {{'buffers',symbols={alternate_file='',directory=''}}},
        lualine_x = {{'filename',path=2}},
        lualine_y = {'encoding'},
        lualine_z = {'filesize', 'progress'},
      },
    },
    lazy=false,
  },
  -- explorer
  {
    'kyazdani42/nvim-tree.lua',
    opts={
      on_attach=function(bufnr)
        local api = require('nvim-tree.api')
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.del('n','f',{ buffer = bufnr })
        vim.keymap.del('n','F',{ buffer = bufnr })
        vim.keymap.set('n','f',api.tree.toggle)
        vim.keymap.set('n','F',api.tree.toggle)
        vim.keymap.set('n','<C-/>',function()api.tree.open();api.live_filter.start();end)
        vim.keymap.set('n','<M-/>',function()api.tree.open();api.live_filter.start();end)
        vim.keymap.set('n','?',api.tree.toggle_help)
      end,
      disable_netrw=true,
      hijack_unnamed_buffer_when_opening=true,
      sync_root_with_cwd = true,
      respect_buf_cwd = true,
      renderer={
        special_files = {},
        indent_markers = {
          enable = true,
          inline_arrows = true,
          icons = {
            corner = "└",
            edge = "│",
            item = "│",
            bottom = "─",
            none = " ",
          },
        },
        icons={
          show={
            file = false,
            folder = true,
            folder_arrow = false,
            git = true,
            modified = true,
            diagnostics = true,
            bookmarks = true,
          },
          glyphs = {
            default = ' ',
            symlink = ' ',
            bookmark = ' ',
            modified = ' ',
            folder = {
              arrow_open = "<",
              arrow_closed = ">",
              default = ">",
              open = "<",
              empty = ">",
              empty_open = "<",
              symlink = ">",
              symlink_open = "<",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
         },
        }
      },
      update_focused_file = {
        enable = true,
        update_root = {
          enable = true,
          ignore_list = {},
        },
        exclude = false,
      },
      diagnostics = {
        enable = true,
        show_on_dirs = false,
        show_on_open_dirs = true,
        icons = {
          hint = "H",
          info = "I",
          warning = "W",
          error = "E",
        },
      },
    },
    lazy=false,
  },
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup{
        patterns = { ".git", ".svn", ".clang-format", "Makefile", "go.mod", "package.json" },
      }
    end,
    lazy=false,
  },
  -- comment
  {
    'numToStr/Comment.nvim',
    opts={
      toggler={line=";"},
      opleader={line=";"},
    },
    lazy=false,
  },
  -- autopairs
  {
    'windwp/nvim-autopairs',
    event="InsertEnter",
    config=true,
  },
  -- lsp
  'neovim/nvim-lspconfig',
  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-nvim-lsp-signature-help',
  'hrsh7th/nvim-cmp',
  'saadparwaiz1/cmp_luasnip',
  'L3MON4D3/LuaSnip',
  'rafamadriz/friendly-snippets',
})
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
		end,{'i'}),
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
		end,{'i'})
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'luasnip' },
	}, {
		{ name = 'buffer' }
	})
})
cmp.setup.cmdline({ '/', '?' }, {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	}),
	matching = { disallow_symbol_nonprefix_matching = false }
})

--vscode snippets
require("luasnip.loaders.from_vscode").lazy_load()

--start lsp server
require('lspconfig')['gopls'].setup {
	cmd={'gopls'},
	capabilities=require('cmp_nvim_lsp').default_capabilities(),
	setting={
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			gofumpt = true,
		},
	},
}
