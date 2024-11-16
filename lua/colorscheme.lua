-- Default fallback colorscheme
vim.cmd "colorscheme default"

-- Define your preferred colorscheme
local colorscheme = "catppuccin"

-- Helper function to load a configuration dynamically
local function load_colorscheme_config(scheme)
  local status, _ = pcall(require, "configs." .. scheme)
  if not status then
    vim.notify("No configuration found for colorscheme: " .. scheme)
  end
end

-- Try to load the colorscheme
local status_ok, _ = pcall(function()
  -- Dynamically load the setup file if it exists
  load_colorscheme_config(colorscheme)

  -- Apply the chosen colorscheme
  vim.cmd("colorscheme " .. colorscheme)
end)

-- Notify if colorscheme fails to load
if not status_ok then
  vim.notify("Colorscheme " .. colorscheme .. " not found! Falling back to default.")
end

