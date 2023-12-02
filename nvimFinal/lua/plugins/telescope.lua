return {
  -- {
  --   'nvim-telescope/telescope.nvim',
  --   branch = '0.1.x',
  --   dependencies = {
  --       'nvim-lua/plenary.nvim',
  --       {
  --           'nvim-telescope/telescope-fzf-native.nvim',
  --           build = 'make',
  --           cond = function()
  --           -- Enable telescope fzf native, if installed
  --               pcall(require('telescope').load_extension, 'fzf')
  --               return vim.fn.executable 'make' == 1
  --           end,
  --       },
  --   },
  -- },
  "nvim-telescope/telescope-file-browser.nvim",
  "nvim-telescope/telescope-hop.nvim",
  "nvim-telescope/telescope-ui-select.nvim",
  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  {
    "ThePrimeagen/git-worktree.nvim",
    config = function()
      require("git-worktree").setup {}
    end,
  },
  {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup()
    end,
  }
}
