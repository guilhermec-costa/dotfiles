require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "vimdoc",
    "javascript",
    "typescript",
    "c",
    "lua",
    "rust",
    "python"
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  autopairs = { enable = true },
  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,
    filetypes = { "html", "xml" },
  },

  indent = {
    enable = true
  },
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    disable = { "javascript", "typescript" },
  },
}
