-- :help options
-- Basic Settings
local options = {
  backup = false,                           -- Don't create a backup file
  swapfile = false,                         -- Don't use swap files
  writebackup = false,                      -- Disable write backup

  -- Clipboard & Command Line
  clipboard = "unnamedplus",                -- Enable system clipboard
  cmdheight = 1,                            -- More space for command-line messages

  -- UI Settings
  termguicolors = true,                     -- Enable GUI colors
  number = true,                            -- Show line numbers
  relativenumber = false,                   -- Disable relative line numbers
  cursorline = true,                        -- Highlight current line
  showmode = false,                          -- Show mode
  showtabline = 2,                          -- Always show tabline
  signcolumn = "yes",                       -- Always show sign column
  wrap = true,                              -- Enable line wrap
  scrolloff = 8,                            -- Minimum lines above/below cursor
  sidescrolloff = 8,                        -- Minimum columns left/right of cursor

  -- Editing Behavior
  smartcase = true,                         -- Smart case search
  ignorecase = true,                        -- Case insensitive search
  smartindent = true,                       -- Enable smart indenting
  expandtab = true,                         -- Convert tab to spaces
  shiftwidth = 2,                           -- Indentation size
  tabstop = 2,                              -- Tab size
  conceallevel = 0,                         -- Show concealed text (e.g., Markdown)
  fileencoding = "utf-8",                   -- File encoding

  -- Performance
  timeoutlen = 1000,                        -- Timeout length for mappings
  updatetime = 300,                         -- Faster completion
  pumheight = 10,                           -- Pop-up menu height

  -- Miscellaneous
  hlsearch = true,                          -- Highlight all search matches
  mouse = "a",                              -- Enable mouse in all modes
}

local commands = {
  "set whichwrap+=<,>,[,],h,l",             -- Allow cursor wrapping
  "set iskeyword+=-",                       -- Treat hyphen as part of a word
  "set formatoptions-=cro",                 -- Adjust format options
}

-- Apply options
for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Apply commands
for _, cmd in ipairs(commands) do
  vim.cmd(cmd)
end

-- Append to shortmess
vim.opt.shortmess:append("c")

