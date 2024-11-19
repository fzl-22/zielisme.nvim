local formatter_is_ok, formatter = pcall(require, "formatter")
if not formatter_is_ok then
  return
end

formatter.setup({
  logging = true,
  log_level = vim.log.levels.WARN,
  filetype = {
    lua = require("formatter.filetypes.lua").stylua,
  }
})
