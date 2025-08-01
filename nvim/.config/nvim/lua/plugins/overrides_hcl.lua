return {
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        hcl = { "tflint", "terraform_fmt" },
        -- "tofu" is not a valid filetype, so we need to use hcl
        -- and add a new formatter for it.
        opentofu = { "tflint", "terraform_fmt" },
      },
    },
  },
}