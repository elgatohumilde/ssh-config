-----------------
---- plugins ----
-----------------
vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.pack.add {
    { src = "https://github.com/stevearc/oil.nvim" },

    { src = "https://github.com/aserowy/tmux.nvim" },

    { src = "https://github.com/j-hui/fidget.nvim" },
    { src = "https://github.com/nvim-treesitter/nvim-treesitter" },

    { src = "https://github.com/folke/snacks.nvim" },
    { src = "https://github.com/echasnovski/mini.nvim" },

    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/jiaoshijie/undotree" },
}
require "mini.icons".setup()

require "mini.sessions".setup()
require "mini.surround".setup()
require "mini.pairs".setup()
require "mini.ai".setup()

---@diagnostic disable-next-line: missing-fields
require "nvim-treesitter.configs".setup {
    auto_install = true,
    highlight = { enable = true },
}

require "fidget".setup {}

require "undotree".setup()
require "snacks".setup()
require "tmux".setup()
require "oil".setup()

vim.ui.select = Snacks.picker.select

vim.diagnostic.config { virtual_text = true, }
vim.lsp.enable { "lua_ls" }


--------------
---- opts ----
--------------
vim.o.encoding = "UTF-8"

vim.o.number = true
vim.o.relativenumber = true

vim.o.autoindent = true
vim.o.smartindent = true
vim.o.breakindent = true

vim.o.expandtab = true
vim.o.smarttab = true

vim.o.cursorline = true
vim.o.winborder = "rounded"

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.undofile = true
vim.o.swapfile = false

vim.o.wrap = false

vim.o.splitright = true
vim.o.splitbelow = true

vim.o.laststatus = 0
vim.o.showmode = false
vim.o.background = "dark"

vim.o.tabstop = 2
vim.o.shiftwidth = 4

vim.o.virtualedit = "all"
vim.o.clipboard = "unnamedplus"

vim.o.termguicolors = true
vim.g.have_nerd_font = true


------------------
---- autocmds ----
------------------
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function() vim.highlight.on_yank() end
})
vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    callback = function() vim.cmd "normal! zz" end
})
vim.api.nvim_create_autocmd("BufWritePre", {
    callback = function() vim.lsp.buf.format() end
})


-----------------
---- keymaps ----
-----------------
local map = vim.keymap.set

map("n", "q:", "<nop>")
map("n", "<leader>/", "/")
map("v", "<leader>r", "\"hy:%s/<C-r>h//g<left><left>")

map("o", "ie", ":<C-u>normal! mzggVG<CR>`z")
map("x", "ie", ":<C-u>normal! ggVG<CR>")

map("n", "<leader>-", ":sp<CR>")
map("n", "<leader>|", ":vs<CR>")

map("n", "<leader>n", ":e $MYVIMRC<CR>")

map("n", "U", "<C-r>")
map({ "n", "v" }, "gh", "^")
map({ "n", "v" }, "gl", "$")
map({ "n", "v" }, "gL", "g$")

map("x", "<leader>p", "\"_dP")
map("n", "<Esc>", ":nohl<CR>")
map("t", "<Esc><Esc>", "<C-\\><C-n>")
map("n", "<A-z>", ":b#<CR>")

map("n", "<C-s>", ":Oil<CR>")

map("n", "<leader>q", Snacks.bufdelete.delete)
map("n", "<leader>Q", Snacks.bufdelete.other)

map("n", "/", Snacks.picker.lines)
map("n", "\\", Snacks.picker.zoxide)
map("n", "<A-s>", Snacks.picker.spelling)
map("n", "<leader>sg", Snacks.picker.grep)
map("n", "<leader>sh", Snacks.picker.help)
map("n", "<leader>sf", Snacks.picker.files)
map("n", "<leader>sd", Snacks.picker.diagnostics)
map("n", "<leader><leader>", Snacks.picker.buffers)

map("n", "<leader>ut", require("undotree").toggle)

map("n", "<leader>tp", ":TypstPreviewToggle<CR>")

map("n", "K", vim.lsp.buf.hover)
map("n", "<leader>f", vim.lsp.buf.format)
map("n", "<leader>rn", vim.lsp.buf.rename)
map("n", "<leader>ca", vim.lsp.buf.code_action)
map("n", "<leader>D", vim.diagnostic.open_float)

map("n", "gr", Snacks.picker.lsp_references)
map("n", "gd", Snacks.picker.lsp_definitions)
map("n", "gD", Snacks.picker.lsp_declarations)
map("n", "<leader>so", Snacks.picker.lsp_symbols)
map("n", "gi", Snacks.picker.lsp_implementations)
map("n", "gt", Snacks.picker.lsp_type_definitions)


---------------
---- theme ----
---------------
vim.cmd "colorscheme meh"
vim.cmd [[
    hi Normal guibg=none
    hi LineNr guibg=none
]]

-- vim.pack.update()
