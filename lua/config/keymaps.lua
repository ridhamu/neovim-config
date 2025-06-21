-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)


vim.g.mapleader = " "
vim.g.maplocalleader = "\\"


-- register another keymap here(because leader already " ")
vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { desc = "Toggle Neo-tree" })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { silent = true })

