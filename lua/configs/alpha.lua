local alpha_ok, alpha = pcall(require, "alpha")
if not alpha_ok then
    return
end

local dashboard_ok, dashboard = pcall(require, "alpha.themes.dashboard")
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

_G.zielisme_open_url = function(url)
    if vim.fn.has("unix") == 1 then
        if vim.fn.has("macunix") == 1 then
            vim.cmd(string.format([[silent !open %s]], url))
        else
            vim.cmd(string.format([[silent !xdg-open %s]], url))
        end
    end
end

-- Set header
dashboard.section.header.val = zielisme_header

-- Set buttons
dashboard.section.buttons.val = {
    dashboard.button("p", "  Recent Projects", ":Telescope project<CR>"),

    dashboard.button("r", "  Recent Files", ":Telescope oldfiles<CR>"),

    dashboard.button("f", "  Search", ":Telescope find_files<CR>"),
    
    dashboard.button("u", "󰊳  Update", ":PackerUpdate<CR>"),
    
    dashboard.button("g", "  fzl-22/zielisme.nvim", ":lua _G.zielisme_open_url('https://github.com/fzl-22/zielisme.nvim')<CR>"),
}

dashboard.section.footer.val = {
    "",
    "",
    "A computer is like air conditioning - it becomes useless when you open Windows",
    "",
    "-- Linus Torvalds --",
}

-- Send config to alpha
alpha.setup(dashboard.opts)

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])