-- lsp additions
  return {
    "neovim/nvim-lspconfig",
    dependencies = {
      "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    },
    init = function()
      require("lsp_lines").setup()
    end,
    keys = { { "<leader>l", "<cmd>lua require('lsp_lines').toggle()<cr>", desc = "Toggle LSP Lines" } },
    opts = {
      diagnostics = {
        virtual_text = false,
        virtual_lines = { only_current_line = true },
      },
      inlay_hints = {
        enabled = true,
      },
      servers = {
        bufls = {},
        cssls = {},
      },
    },
  }
