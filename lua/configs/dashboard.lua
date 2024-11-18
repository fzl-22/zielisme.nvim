local dashboard_ok, dashboard = pcall(require, "dashboard")
if not dashboard_ok then
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

local function open_url(url)
  if vim.fn.has('unix') == 1 then
    if vim.fn.has('macunix') == 1 then
      vim.cmd(string.format([[silent !open %s]], url))
    else
      vim.cmd(string.format([[silent !xdg-open %s]], url))
    end
  end
end

dashboard.setup({
  theme = "hyper",
  config = {
    header = zielisme_header,
    shortcut = {
      { desc = '󰊳 Update', group = '@property', action = 'PackerUpdate', key = 'u' },
      { desc = ' Search', group = '@property', action = 'Telescope find_files', key = 'f' },
      { desc = ' fzl-22/zielisme.nvim', group = '@property', action = function() open_url("https://github.com/fzl-22/zielisme.nvim") end, key = 'g'}
    },
    footer = { "", "", "A computer is like air conditioning - it becomes useless when you open Windows", "", "-- Linus Torvalds --" },
  },
})
