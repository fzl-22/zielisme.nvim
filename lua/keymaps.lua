local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorted function name
local keymap = vim.api.nvim_set_keymap

-- Remap ; to : in normal mode
keymap("n", ";", ":", { desc = "CMD enter command mode" })

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.g.neovide_input_macos_alt_is_meta = true

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with + and -
-- Resize horizontally with Ctrl+(+) and Ctrl+(-)
keymap("n", "<C-=>", ":vertical resize +2<CR>", opts) -- Increase width
keymap("n", "<C-->", ":vertical resize -2<CR>", opts) -- Decrease width
-- Resize vertically with Ctrl+Shift+(+) and Ctrl+Shift+(-)
keymap("n", "<C-S-=>", ":resize +2<CR>", opts) -- Increase height
keymap("n", "<C-S-->", ":resize -2<CR>", opts) -- Decrease height


-- Navigate buffers
keymap("n", "<S-t>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Insert --
-- Press jk fast to enter
keymap("i", "jk", "<ESC>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<C-A-k>", ":m .-2<CR>==", opts)
keymap("v", "<C-A-j>", ":m .+1<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<C-A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Tabnine integration
--- Example integration with Tabnine and LuaSnip; falling back to inserting tab if neither has a completion
vim.keymap.set("i", "<tab>", function()
  if require("tabnine.keymaps").has_suggestion() then
    return require("tabnine.keymaps").accept_suggestion()
  elseif require("luasnip").jumpable(1) then
    return require("luasnip").jump(1)
  else
    return "<tab>"
  end
end, { expr = true })

-- Telescope
-- File-related actions
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts) -- 'ff' for find files
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", vim.tbl_extend("force", opts, { desc = "Search text in project" })) -- 'fg' for find grep (live search)
-- Diagnostics and LSP
keymap("n", "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<cr>", vim.tbl_extend("force", opts, { desc = "Find in current buffer" })) -- 'fb' for find in buffer
vim.api.nvim_set_keymap(
  "n",
  "<leader>ld",
  "<cmd>lua require'telescope.builtin'.diagnostics(require('telescope.themes').get_ivy({ layout_config = { height = 0.3, results_width = 1 }, previewer = false }))<CR>",
  vim.tbl_extend("force", opts, { desc = "List diagnostics (bottom layout)" })
)

-- Nvimtree
keymap("n", "<leader>n", "<cmd>NvimTreeToggle<cr>", opts)

