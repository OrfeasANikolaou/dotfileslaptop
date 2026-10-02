-- STUFF TO REMEMBER
-- g< Enter message window
-- gu/gU/~ lowercase/uppercase/toggle
-- (g)J combine current and line below (without space)
-- g[motion] when line is long and takes multiple visual lines, but not actual lines move like this
-- gq split multiple visual lines to actual lines
-- Ctrl-A/X increase/decrease number
-- g Ctrl-A/X increase/decrease number column
-- K open link
-- gf open text as file path
-- gx link


-- start vim options
--
--
vim.o.termguicolors = true
vim.cmd.colorscheme("phoenix")
vim.o.swapfile = false
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.signcolumn = "yes"
vim.g.mapleader = " "
vim.g.maplocalleader = " "
require('vim._core.ui2').enable()
vim.o.statusline = "[CWD]=%{getcwd()} [FILE]=%f %h%m%r L=%l/%L,C=%c"

vim.o.wildignorecase = true
vim.api.nvim_create_autocmd("CmdlineChanged", {
  pattern = { ":", "/", "?" },
  callback = function()
    vim.fn.wildtrigger()
  end,
})
vim.o.wildmode = 'noselect:lastused,full'
vim.o.wildoptions = 'fuzzy'

-- vim.o.guicursor = "i:block"
vim.o.scrolloff = 18
vim.o.mouse = "a"
vim.o.cursorline = true
-- numbers
vim.o.number = true
vim.o.relativenumber = true

-- searching
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.ignorecase = true

-- Save undo history
vim.o.undofile = true

-- show new window when doing substitutions
vim.o.inccommand='split'

-- tabs > spaces
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true
vim.o.softtabstop = 0

--folding
vim.o.foldcolumn = "1"

-- show whitespace
vim.o.list = true
vim.o.listchars = 'trail:·,tab:»»,nbsp:␣,space:·'
--
--
-- end vim options

-- start hotkeys
--
-- { n-mode <C-d> }
vim.keymap.set(
 "n",
 "<C-d>",
 "20<C-d>"
)
-- { n-mode <C-u> }
vim.keymap.set(
 "n",
 "<C-u>",
 "20<C-u>"
)
-- { n-mode <A-j> } Move current line down
vim.keymap.set(
 "n",
 "<A-j>",
 "<cmd>m+1<CR>"
)
-- { n-mode <A-k> } Move current line up
vim.keymap.set(
 "n",
 "<A-k>",
 "<cmd>m-2<CR>"
)
-- { n-mode <C-j> } Copy paste current line down
vim.keymap.set(
 "n",
 "<C-j>",
 "<cmd>copy.<CR>"
)
-- { n-mode <C-k> } Copy paste current line up
vim.keymap.set(
 "n",
 "<C-k>",
 "<cmd>copy-1<CR>"
)
-- searching
-- { v-mode <leader>/ } Search within visual selection
vim.keymap.set(
  "v",
  "<leader>/",
  "<ESC>/\\%V",
  { desc = "Search within visual selection" }
)
-- { n-mode <leader>i } Toggle case sensitivity while querying 
vim.keymap.set(
 "n",
 "<leader>i",
 "<cmd>set invignorecase<CR>",
 { desc = "Toggle ignorecase" }
)
-- { <Esc> } Remove highlighting
vim.keymap.set(
 "n",
 "<Esc>",
 "<cmd>nohlsearch<CR>"
)

-- substitutions
-- { n-mode         <leader>sf } substitute on current file
vim.keymap.set(
  "n",
  "<leader>sf",
  ":%s/",
  { desc = "Regex substitute on current file" }
)
-- { n-mode, v-mode <leader>sl } substitute on current line 
vim.keymap.set(
 {"n","v"},
 "<leader>sl",
 ":s/",
 { desc = "Regex substitute on current line" }
)

-- { n-mode <leader>e } open file (search from cwd)
vim.keymap.set(
  "n",
  "<leader>e",
  ":e <C-r>=getcwd()<CR>/",
  { desc = "Open file (search from cwd)" }
)

-- file explorers
-- { n-mode <leader>n } Open Oil on current dirctory
vim.keymap.set(
 "n",
 "<leader>n",
 "<cmd>Oil<CR>",
 { desc = "Open Oil.nvim" }
)

-- { n-mode <leader>b } Show files available in buffer
vim.keymap.set(
 "n",
 "<leader>b",
 ":b ",
 { desc = "Show files available in buffer" }
)

-- CORE UTILS
-- { n-mode <leader>m } Open man page inside neovim
vim.keymap.set(
 "n",
 "<leader>m",
 ":vertical Man ",
 { desc = "Open man page inside neovim" }
)
-- { n-mode <leader>d } Set current directory same as current file 
vim.keymap.set(
 "n",
 "<leader>d",
 "<cmd>cd %:h<CR>",
 -- printing current dir no longer necessary because of vim.o.statusline = "%f %h%m%r %{getcwd()}" on line 9
 --"<cmd>cd %:h<CR><cmd>pwd<CR>",
 { desc = "Set current directory same as current file" }
)
-- { n-mode <leader>l } List files in current dir (hidden included) 
vim.keymap.set(
 "n",
 "<leader>l",
 "<cmd>!ls -lAh --group-directories-first --sort=extension<CR>",
 { desc = "List files in current dir (hidden included)"}
)
-- { n-mode <leader>f } Find file (requires fd installed on path)
vim.keymap.set(
 "n",
 "<leader>f",
 ":!fd --hidden ",
 { desc = "Find" }
)
-- { n-mode <leader>r } Grep file
-- NOTE: changed from !rg --hidden to inbuild grep command since it supports quickfix list
-- NOTE: changed from grep to grep!/Grep so it doesnt automatically jump to first thing on quickfix list
vim.keymap.set(
 "n",
 "<leader>r",
 ":grep! ",
 { desc = "Grep" }
)
-- { n-mode <leader>t } Show tree of current directory
vim.keymap.set(
 "n",
 "<leader>t",
 ":!tree<CR>",
 { desc = "Tree of current dir" }
)
-- { n-mode <leader>c } Run shell command
vim.keymap.set(
 "n",
 "<leader>c",
 ":!",
 { desc = "Run shell command" }
)
--
-- { n-mode <leader>o } Open quickfix list
vim.keymap.set(
 "n",
 "<leader>o",
 "<cmd>copen<CR>",
 { desc = "Open quickfix list" }
)
-- end hotkeys

-- Share os and vim keyboard buffer
vim.schedule(function()
  vim.o.clipboard = "unnamedplus"
end)
-- Highlight when yanking (copying) text
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
-- Automatically save and load view (folds, cursor position, etc.)
vim.api.nvim_create_autocmd({ "BufWinLeave" }, {
  pattern = "*",
  command = "silent! mkview",
})
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  pattern = "*",
  command = "silent! loadview",
})
