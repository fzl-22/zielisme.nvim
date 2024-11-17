local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  return
end

local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

local cmp_autopairs = require "nvim-autopairs.completion.cmp"

-- Autopairs setup
npairs.setup {
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    typescript = { "string", "template_string" },
    dart = { "string", "template_string" },
    python = { "string", "f_string" },
    rust = { "string", "comment" },
    go = { "string", "comment" },
    c = { "string", "comment" },
    cpp = { "string", "comment" },
  },
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0, -- Offset from pattern match
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr",
  },
}

cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

