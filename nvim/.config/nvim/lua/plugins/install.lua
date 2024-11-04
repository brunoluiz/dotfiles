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
}
