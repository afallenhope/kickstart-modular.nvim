-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window', silent = true })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window', silent = true })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window', silent = true })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window', silent = true })
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>', { desc = 'Toggle NvimTree', silent = true })

-- Buffer management
vim.keymap.set('n', '<leader>n', ':bnext<cr>', { desc = 'Next buffer', silent = true })
vim.keymap.set('n', '<leader>p', ':bprev<cr>', { desc = 'Prevous buffer', silent = true })
vim.keymap.set('n', '<leader>q', ':bdelete<cr>', { desc = 'Close buffer', silent = true })
vim.keymap.set('n', '<a-j>', ':m .+1<cr>==', { desc = 'Move line down', silent = true })
vim.keymap.set('n', '<a-k>', ':m .-2<cr>==', { desc = 'Move line up', silent = true })
vim.keymap.set('n', '<C-s>', ':w<cr>', { desc = 'Save buffer', silent = true })

-- Visual Mode
vim.keymap.set('v', 'J', ':m .+1<cr>==', { desc = 'Move line up', silent = true })
vim.keymap.set('v', 'K', ':m .-2<cr>==', { desc = 'Move line down', silent = true })
vim.keymap.set('v', '<a-j>', ':m +1<cr>==', { desc = 'Move line up', silent = true })
vim.keymap.set('v', '<a-k>', ':m .-2<cr>==', { desc = 'Move live down', silent = true })
vim.keymap.set('v', 'p', '"_dP', { desc = 'Special paste', silent = true })
vim.keymap.set('v', '<', '<gv', { desc = 'Indent lines', silent = true })
vim.keymap.set('v', '>', '>gv', { desc = 'Indent lines', silent = true })

-- Visual Block
vim.keymap.set('x', 'J', ":m '>+1<cr>==gv-gv", { desc = 'Move line up', silent = true })
vim.keymap.set('x', 'K', ":m '<-2<cr>==gv-gv", { desc = 'Move Line down', silent = true })
vim.keymap.set('x', '<a-j>', ":m '<+1<cr>==gv-gv", { desc = 'Move line up', silent = true })
vim.keymap.set('x', '<a-k>', ":m '>-2<cr>==gv-gv", { desc = 'Move line down', silent = true })

-- Insert Mode
vim.keymap.set('i', '<a-j>', '<esc>:m +1<cr>==gi', { desc = 'Move line down', silent = true })
vim.keymap.set('i', '<a-k>', '<esc>:m .-2<cr>==gi', { desc = 'Move line up', silent = true })
vim.keymap.set('i', '<c-s>', '<esc>:w<cr>a', { desc = 'Move line up', silent = true })
vim.keymap.set('i', '<c-a>', "<esc>gg'+yG", { desc = 'Move line down', silent = true })

--
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
vim.keymap.set('i', 'jk', '<esc>', { desc = 'Exit insert mode' })
