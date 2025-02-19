local tabnine_is_ok, tabnine = pcall(require, "tabnine")
if not tabnine_is_ok then
  return
end

tabnine.setup({
  disable_auto_comment=true,
  accept_keymap="<C-l>",
  dismiss_keymap = "<C-]>",
  debounce_ms = 1000,
  suggestion_color = {gui = "#808080", cterm = 244},
  exclude_filetypes = {"TelescopePrompt", "NvimTree"},
  log_file_path = nil, -- absolute path to Tabnine log file
  ignore_certificate_errors = false,
})

