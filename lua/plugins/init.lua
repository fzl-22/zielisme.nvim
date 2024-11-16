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
    autocmd BufWritePost init.lua source <afile> | PackerSync
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

  use { "catppuccin/nvim", as = "catppuccin", config = function() require("configs.catppuccin") end } -- Catppuccin colorschemes

  use "rstacruz/vim-closer" -- Automatic brackets closer

  use {'iamcco/markdown-preview.nvim', run = 'cd app && npm install', cmd = 'MarkdownPreview'} -- Markdown preview

  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)

