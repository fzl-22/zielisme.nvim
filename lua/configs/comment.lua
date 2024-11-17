local status_ok, context_commentstring = pcall(require, "ts_context_commentstring")
if not status_ok then
  return
end

context_commentstring.setup ({
  enable_autocmd = false,
})

