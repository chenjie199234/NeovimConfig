require('comment').setup()
vim.api.nvim_set_keymap('n',';',':lua require("Comment.api").toggle_current_linewise()<CR>',{silent = true})
vim.api.nvim_set_keymap('v',';',[[line("'<") == line("'>") ? ':lua require("Comment.api").toggle_current_linewise_op(vim.fn.visualmode())<CR>' : ':lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>']],{silent = true,expr = true})
