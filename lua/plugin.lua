local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- My plugins here
  -- manage self
  use 'wbthomason/packer.nvim'
  -- color
  use 'Mofiqul/vscode.nvim'
  require('plugin_color')
  -- statusline
  use 'nvim-lualine/lualine.nvim'
  require('plugin_statusline')
  -- explorer
  use 'kyazdani42/nvim-tree.lua'
  require('plugin_explorer')
  -- comment
  use 'numToStr/Comment.nvim'
  require('plugin_comment')
  -- autopairs
  use 'windwp/nvim-autopairs'
  require('plugin_pair')
  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  use "rafamadriz/friendly-snippets"
  require('plugin_lsp')
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
