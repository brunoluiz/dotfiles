return {
  { import = "plugins.overrides_hcl" },
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        hidden = true,
        exclude = { ".git" },
      },
      picker = {
        hidden = true,
        sources = {
          files = {
            hidden = true,
          },
        },
        file_ignore_patterns = { "%.git/", "node_modules/", "__pycache__/", "%.venv/", "venv/", ".venv/" },
      },
    },
  },
}