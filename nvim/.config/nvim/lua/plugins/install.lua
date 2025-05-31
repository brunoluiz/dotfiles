-- if vim.g.did_load_filetypes then
--   return
-- end

-- local augroup = vim.api.nvim_create_augroup("filetypedetect", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
--   pattern = "justfile",
--   command = "setfiletype make",
--   group = augroup,
-- })

return {
  { "cappyzawa/starlark.vim", ft = "tiltfile" },
  { "IndianBoy42/tree-sitter-just" },
  { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
  { "nvim-lua/plenary.nvim" },
  {
    "Davidyz/VectorCode",
    version = "*", -- optional, depending on whether you're on nightly or release
    build = "pipx upgrade vectorcode", -- optional but recommended. This keeps your CLI up-to-date.
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  {
    "olimorris/codecompanion.nvim",
    opts = {
      log_level = "DEBUG",
      extensions = {
        vectorcode = {
          opts = {
            add_tool = true,
            add_slash_command = true,
            tool_opts = {},
            ls_on_start = true,
          },
        },
      },
    },
    dependencies = { "nvim-lua/plenary.nvim", "nvim-treesitter/nvim-treesitter", "Davidyz/VectorCode" },
  },
}
