-- vim.g.dashboard_default_executive = 'telescope'
local status_ok, dashboard = pcall(require, "dashboard")
if not status_ok then
  return
end

local zielisme_header = {
  "",
  "",
  "",
  "",
  "███████╗ ██╗ ███████╗ ██╗      ██╗ ███████╗ ███╗   ███╗ ███████╗",
  "╚══███╔╝ ██║ ██╔════╝ ██║      ██║ ██╔════╝ ████╗ ████║ ██╔════╝",
  "  ███╔╝  ██║ █████╗   ██║      ██║ ███████╗ ██╔████╔██║ █████╗  ",
  " ███╔╝   ██║ ██╔══╝   ██║      ██║ ╚════██║ ██║╚██╔╝██║ ██╔══╝  ",
  "███████╗ ██║ ███████╗ ███████╗ ██║ ███████║ ██║ ╚═╝ ██║ ███████╗",
  "╚══════╝ ╚═╝ ╚══════╝ ╚══════╝ ╚═╝ ╚══════╝ ╚═╝     ╚═╝ ╚══════╝",
  "",
  "",
  "",
}


local neovim_header = {
	"",
	"",
	"",
	"",
	" ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
	" ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
	" ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
	" ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
	" ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
	" ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
	"",
	"",
	"",
}

dashboard.setup({
  theme = "hyper",
  config = {
    header = zielisme_header,
    shortcut = {
      { desc = '󰊳 Update', group = '@property', action = 'PackerUpdate', key = 'u' },
      { desc = ' Search', group = '@property', action = 'Telescope find_files', key = 'f' },
      { desc = ' @fzl-22', group = '@property', action = function() vim.cmd([[silent !open https://github.com/fzl-22]]) end, key = 'g'}
    },
    footer = { "", "", "A computer is like air conditioning - it becomes useless when you open Windows", "", "-- Linus Torvalds --" },
  },
})
