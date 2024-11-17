-- Default fallback colorscheme
vim.cmd("colorscheme default")

-- Define preferred colorscheme
local preferred_colorscheme = "catppuccin"

-- Function to apply a colorscheme with optional configuration
local function apply_colorscheme(scheme)
  -- Attempt to load the configuration for the colorscheme
  local config_ok = pcall(require, "configs." .. scheme)
  if not config_ok then
    return false, "No configuration found for colorscheme: " .. scheme
  end

  -- Attempt to apply the colorscheme
  local status_ok = pcall(vim.cmd, "colorscheme " .. scheme)
  if not status_ok then
    return false, "Colorscheme " .. scheme .. " not found! Falling back to default."
  end

  -- Success
  return true, "Colorscheme " .. scheme .. " applied successfully."
end

-- Apply preferred colorscheme and handle the result
local success, message = apply_colorscheme(preferred_colorscheme)
if not success then
  return
end

