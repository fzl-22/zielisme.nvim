require("catppuccin").setup({
  flavour = "macchiato",
  default_integrations = true,
  integrations = {
    cmp = true,
    markdown = true,
    nvimtree = true,
    mason = true,
    native_lsp = {
      enabled = true,
      virtual_text =  {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        informations = { "italic" },
        ok = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
        ok = { "underline" },
      },
      inlay_hints = {
        background = true,
      }
    },
    treesitter = true,
    rainbow_delimiters = true,
    telescope = {
      enabled = true,
    },
  }
})

vim.cmd.colorscheme "catppuccin"
