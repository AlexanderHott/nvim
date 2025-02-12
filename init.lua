--[[
========== Options ==========
:help option-list
]]
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.mouse = "a"
vim.o.showmode = false
vim.o.clipboard = "unnamed" -- TODO: use two diff clipboards with <leader>y/<leader>p
vim.o.breakindent = true
vim.opt.smartindent = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("XDG_DATA_HOME") .. "/nvim/undodir"
vim.o.undofile = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.o.ignorecase = true -- use \C for case sensitive in search
vim.o.smartcase = true
vim.opt.inccommand = "split"
vim.opt.cursorline = true

vim.o.signcolumn = "yes"
vim.o.updatetime = 250 -- ms
vim.o.timeoutlen = 300 -- ms

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.opt.scrolloff = 10

vim.opt.isfname:append("@-@")

vim.opt.whichwrap:append("<>[]hl")

vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

vim.o.foldmethod = "indent"
vim.o.foldlevel = 999

vim.keymap.set("n", "<Tab>", "za")
-- for some reason, tab = ctrl+i in terminal codes or something
vim.keymap.set("n", "<C-i>", "<C-i>")
--[[
========== Key Maps ==========
:help vim.keymap.set()
]]
-- center window when moving
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- two clipboard
vim.keymap.set("n", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
-- vim.keymap.set({ "n", "v" }, "p", '"0p', { desc = "[P]aste" })
-- vim.keymap.set({ "n", "v" }, "P", '"0P')

-- 1
-- 2

-- diagnostics
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- window navigation
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- run lua in current file
vim.keymap.set("n", "<leader>rf", "<CMD>source %<CR>", { desc = "[r]un lua [f]ile" })
vim.keymap.set("n", "<leader>rl", ":.lua<CR>", { desc = "[r]un lua [l]ine" })
vim.keymap.set("v", "<leader>rl", ":lua<CR>", { desc = "[r]un lua [l]ines" })
vim.keymap.set("n", "<leader>lt", "<CMD>PlenaryBustedFile %<CR>", { desc = "[l]ua [t]est" })

-- go specific stuff
vim.keymap.set("n", "<leader>n", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

vim.filetype.add({
	extension = { mdx = "markdown.mdx" },
})

--[[
========== Autocommands ==========
:help lua-guide-autocommands
]]

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

--[[
========== Global Funcs ==========
]]

P = function(v)
	print(vim.inspect(v))
	return v
end

RELOAD = function(...)
	return require("plenary.reload").reload_module(...)
end

R = function(name)
	RELOAD(name)
	return require(name)
end

--[[
========== Plugins ==========
:help lazy.nvim.txt
https://github.com/folke/lazy.nvim
]]

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

-- https://github.com/folke/lazy.nvim?tab=readme-ov-file#-structuring-your-plugins
require("lazy").setup("plugins")

-- :help modeline
-- vim: ts=2 sts=2 sw=2 et
