return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
          require("mason").setup()
        end,
      },
      -- {
      --   "williamboman/mason-lspconfig.nvim",
      --   lazy = false,
      --   opts = {
      --     automatic_installation = true,
      --     ensure_installed = {
      --       "lua_ls",
      --       "ts_ls",
      --       "html",
      --       "tailwindcss",
      --       "dockerls"
      --     }
      --   },
      -- },
      {
        "folke/lazydev.nvim",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
    },
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- Configure diagnostics
      vim.diagnostic.config({
        -- virtual_text = {
        --   severity_limit = "Error", -- Only show errors inline, not warnings
        -- },
        signs = true,        -- Show error signs in gutter
        underline = true,    -- Underline errors
        update_in_insert = true, -- Don't update diagnostics in insert mode
        severity_sort = true, -- Sort by severity
        float = {
          border = "rounded",
          source = "always", -- Show source of diagnostic
          header = "",
          prefix = "",
        },
      })

      -- Set global diagnostic keybindings (only once)
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {}) -- Show error in floating window
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})      -- Go to previous diagnostic
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})      -- Go to next diagnostic

      -- Manual setup for each language server
      require("lspconfig").lua_ls.setup({
        capabilities = capabilities,
      })

      require("lspconfig").ts_ls.setup({
        capabilities = capabilities,
      })

      require("lspconfig").html.setup({
        capabilities = capabilities,
      })

      require("lspconfig").tailwindcss.setup({
        capabilities = capabilities,
      })

      require("lspconfig").dockerls.setup({
        capabilities = capabilities,
      })

      require("lspconfig").yamlls.setup({
        capabilities = capabilities,
      })

      require("lspconfig").graphql.setup({
        capabilities = capabilities,
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local c = vim.lsp.get_client_by_id(args.data.client_id)
          if not c then
            return
          end

          -- Set LSP keybindings (buffer-specific)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = args.buf })
          vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { buffer = args.buf })
          vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { buffer = args.buf })
          vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { buffer = args.buf })

          if
              vim.bo.filetype == "lua"
              or vim.bo.filetype == "typescript"
              or vim.bo.filetype == "javascript"
              or vim.bo.filetype == "typescriptreact"
              or vim.bo.filetype == "javascriptreact"
              or vim.bo.filetype == "html"
              or vim.bo.filetype == "css"
              or vim.bo.filetype == "scss"
              or vim.bo.filetype == "vue"
          then
            -- Format the current buffer on save
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, id = c.id })
              end,
            })
          end
        end,
      })
    end,
  },
}
