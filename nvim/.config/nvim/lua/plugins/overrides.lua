return {
  {
    "nvim-pack/nvim-spectre",
    opts = {
      replace_engine = {
        ["sed"] = {
          cmd = "sed",
          args = { "-i", "", "-E" },
        },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      format = { timeout_ms = 10000 },
      servers = {
        yamlls = {
          settings = {
            yaml = {
              format = {
                enable = false,
              },
            },
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["yaml"] = { "yamlfix" },
      },
    },
  },
}
