local treesitter_ok, treesitter_config = pcall(require, "nvim-treesitter.configs")
if not treesitter_ok then
  return
end

local ensure_installed = {
  "bash",
  "bibtex",
  "c",
  "cmake",
  "cpp",
  "css",
  "csv",
  "dart",
  "dockerfile",
  "fish",
  "git_config",
  "git_rebase",
  "gitattributes",
  "gitcommit",
  "gitignore",
  "go",
  "gomod",
  "gosum",
  "html",
  "javascript",
  "json",
  "json5",
  "jsonc",
  "latex",
  "lua",
  "make",
  "markdown",
  "markdown_inline",
  "nginx",
  "prisma",
  "python",
  "query",
  "rust",
  "sql",
  "ssh_config",
  "tsv",
  "typescript",
  "vim",
  "vimdoc",
  "yaml",
}

treesitter_config.setup({
  ensure_installed = ensure_installed,
  auto_install = true,
  sync_install = false,
  ignore_install = { "" },
  highlight = {
    enable = true,
    disable = { "" },
    additional_vim_regex_highlighting = true,
  },
  indent = {
    enable = true,
    disable = { "yaml" }
  },
  rainbow = {
    enable = false,
    extended_mode = true,
    max_file_lines = nil,
  },
})

