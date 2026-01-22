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
            ignored = true,
          },
        },
        file_ignore_patterns = { ".git/" },
      },
    },
  },
}