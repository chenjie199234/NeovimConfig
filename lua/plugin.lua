local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function(use)
  -- manage self
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- indent
  use "lukas-reineke/indent-blankline.nvim"
  -- color
  use 'joshdick/onedark.vim'
  use 'NvChad/nvim-colorizer.lua'
  -- statusline
  use 'nvim-lualine/lualine.nvim'
  -- explorer
  use 'kyazdani42/nvim-tree.lua'
  use "ahmedkhalf/project.nvim"
  -- comment
  use 'numToStr/Comment.nvim'
  -- autopairs
  use 'windwp/nvim-autopairs'
  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/cmp-nvim-lsp-signature-help'
  use 'hrsh7th/nvim-cmp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use 'rafamadriz/friendly-snippets'
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
require('plugin_indent')
require('plugin_color')
require('plugin_statusline')
require('plugin_explorer')
require('plugin_project')
require('plugin_comment')
require('plugin_pair')
require('plugin_lsp')
