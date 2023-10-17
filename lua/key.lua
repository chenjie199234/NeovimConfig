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
