-- Ensure packer.nvim is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

-- Autocommand that reloads Neovim whenever plugins.lua file is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local PACKER_BOOTSTRAP = ensure_packer()

-- Use protected call
local status_ok, packer = pcall(require, "packer")
if not status_ok  then
  return
end

-- Have packer use pop up window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float {border = "rounded" }
    end
  }
}

-- Install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- Have packer.nvim manage itself
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins

  -- NVIM Structures
  use { "nvim-tree/nvim-tree.lua", requires = "nvim-tree/nvim-web-devicons" } -- File explorer plugin
  use { "nvim-lualine/lualine.nvim", requires = "nvim-tree/nvim-web-devicons" }
  use { "nvimdev/dashboard-nvim", requires = "nvim-tree/nvim-web-devicons", event = "VimEnter" } -- Neovim dashboard with ASCII art
  use { "akinsho/bufferline.nvim", requires = "nvim-tree/nvim-web-devicons" }
  use "akinsho/toggleterm.nvim"
  use "moll/vim-bbye"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/mason.nvim" -- simple to use language server installer
  use "williamboman/mason-lspconfig.nvim" -- simple to use language server installer
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Colorschemes
  use { "catppuccin/nvim", as = "catppuccin" } -- Catppuccin colorschemes

  -- Completions
  use "hrsh7th/nvim-cmp" -- Completions plugin
  use "hrsh7th/cmp-buffer" -- Buffer completions
  use "hrsh7th/cmp-path" -- Path completions
  use "hrsh7th/cmp-cmdline" -- Cmdline completions
  use "hrsh7th/cmp-nvim-lsp" -- LSP completions
  use "saadparwaiz1/cmp_luasnip" -- Snippet completions
  use "windwp/nvim-autopairs" -- Autopairs completions
  use { 'codota/tabnine-nvim', run = "./dl_binaries.sh" } -- Tabnine completions

  -- Snippets
  use "L3MON4D3/LuaSnip" -- snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- Telescope
  use "nvim-telescope/telescope.nvim" -- fuzzy file, buffer, mru, etc
  use "nvim-telescope/telescope-media-files.nvim" -- media support for Telescope

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = function() require("nvim-treesitter.install").update({ with_sync = true }) end }
  use "hiphish/rainbow-delimiters.nvim"

  -- Utils
  use { "iamcco/markdown-preview.nvim", run = "cd app && npm install" } -- Markdown preview
  use "lewis6991/gitsigns.nvim" -- Git sign support

  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)

