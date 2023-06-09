return {
  {
    "Shaunaaaaa/darkplus.nvim",
  },
  {
    "gen740/SmoothCursor.nvim",
    cond = vim.g.neovide == nil,
    lazy = false,
    opts = {
      autostart = true,
      fancy = {
        enable = true,
        -- head = { cursor = "▷", texthl = "SmoothCursor", linehl = nil },
        --head = { cursor = "", texthl = "SmoothCursor", linehl = nil },
        head = { cursor = "", texthl = "SmoothCursor", linehl = nil },
        body = {
          { cursor = "", texthl = "SmoothCursorRed" },
          { cursor = "", texthl = "SmoothCursorOrange" },
          { cursor = "●", texthl = "SmoothCursorYellow" },
          { cursor = "●", texthl = "SmoothCursorGreen" },
          { cursor = "•", texthl = "SmoothCursorAqua" },
          { cursor = ".",   texthl = "SmoothCursorBlue" },
          { cursor = ".",   texthl = "SmoothCursorPurple" },
        },
        tail = { cursor = nil, texthl = "SmoothCursor" },
      },
    },
  },

  --悬浮的命令输入框
  {
    "folke/noice.nvim",
    lazy = false,
    config = function()
      require("noice").setup {
        lsp = {
          -- 覆盖markdown渲染，以便**cmp**和其他插件使用**Treesetter**
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          signature = { enabled = false },
          hover = { enabled = false },
        },
        -- 您可以启用一个预设以便于配置
        presets = {
          bottom_search = false,        -- 使用经典的底部命令行进行搜索
          command_palette = true,       -- 将cmdline和弹出菜单放在一起
          long_message_to_split = true, -- 长消息拆分发送
          inc_rename = false,           -- 启用inc-rename.nvim的输入对话框
          lsp_doc_border = false,       -- 为悬停文档和签名帮助添加边框
        },
      }
    end,
  },
  -- 使用彩虹括号
  {
    "HiPhish/nvim-ts-rainbow2",
    lazy = false,
    opts = {
      autostart = true,
    },
    config = function() require "user.plugins.config.nvim-ts-rainbow2" end,
  },
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function() require "user.plugins.config.hlchunk" end,
  },
  --变量变成灰色
  {
    "zbirenbaum/neodim",
    event = "LspAttach",
    config = function() require "user.plugins.config.neodim" end,
  },

  {
    "github/copilot.vim",
    lazy = false,
  },
  {
    "m-demare/hlargs.nvim",
    lazy = false,
    opts = {
      enable = true,
    },
  },
  {
    "ray-x/lsp_signature.nvim",
    lazy = false,
    opts = {
      enable = true,
    },
    user_config = function()
      require("lspconfig").gopls.setup()
      return {
        color = "#ef9062",
        bind = true, -- This is mandatory, otherwise border config won't get registered.
        max_width = 180,
        -- handler_opts = {
        --   border = "rounded"
        -- }
      }
    end,
  },
  {
    "yamatsum/nvim-cursorline",
    lazy = false,
    opts = {
      cursorline = {
        enable = true,
        timeout = 1000,
        number = false,
      },
      cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
      },
    },
  },
  {
    "mg979/vim-visual-multi",
    lazy = false,
  },
  {
    "folke/trouble.nvim", -- Helps you solve all the trouble your code is causing
    keys = { { "<leader>x", "<leader>x", desc = "Trouble help" } },
    cmd = { "Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh" },
    config = function()
      require("trouble").setup {
        mode = "document_diagnostics",
        use_diagnostic_signs = true,
        action_keys = {
          close = { "q", "<esc>" },
          cancel = "<c-e>",
        },
      }
    end,
  },
}
