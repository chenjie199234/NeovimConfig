require('comment').setup()
vim.api.nvim_set_keymap('n',';','gcc',{silent = true})
vim.api.nvim_set_keymap('v',';','gc',{silent = true})
