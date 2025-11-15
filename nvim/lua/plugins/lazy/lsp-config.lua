return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "saghen/blink.cmp",
      "SmiteshP/nvim-navic", -- For breadcrumbs
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
          source = "if_many", -- Show source of diagnostic
          header = "",
          prefix = "",
        },
      })

      -- Set global diagnostic keybindings (only once)
      vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {}) -- Show error in floating window
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {})      -- Go to previous diagnostic
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {})      -- Go to next diagnostic

      -- Manual setup for each language server
      -- Common on_attach function for all LSP servers to enable navic breadcrumbs
      local on_attach = function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          require("nvim-navic").attach(client, bufnr)
        end
      end

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })
      vim.lsp.enable("lua_ls")

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })
      vim.lsp.enable("ts_ls")

      vim.lsp.config("html", {
        capabilities = capabilities,
        on_attach = on_attach,
      })
      vim.lsp.enable("html")

      vim.lsp.config("emmet_language_server", {
        capabilities = capabilities,
        on_attach = on_attach,
        filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
      })
      vim.lsp.enable("emmet_language_server")

      vim.lsp.config("tailwindcss", {
        capabilities = capabilities,
        on_attach = on_attach,
      })
      vim.lsp.enable("tailwindcss")

      vim.lsp.config("dockerls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })
      vim.lsp.enable("dockerls")

      vim.lsp.config("yamlls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })
      vim.lsp.enable("yamlls")

      vim.lsp.config("graphql", {
        capabilities = capabilities,
        on_attach = on_attach,
      })
      vim.lsp.enable("graphql")

      vim.lsp.config("sqlls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })
      vim.lsp.enable("sqlls")

      vim.lsp.config("prismals", {
        capabilities = capabilities,
        on_attach = on_attach,
      })
      vim.lsp.enable("prismals")

      vim.lsp.config("jsonls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })
      vim.lsp.enable("jsonls")

      vim.lsp.config("jdtls", {
        capabilities = capabilities,
        on_attach = on_attach,
      })
      vim.lsp.enable("jdtls")

      vim.lsp.config("copilot_language_server", {
        capabilities = capabilities,
        on_attach = on_attach,
      })

      vim.lsp.enable("copilot_language_server")

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
        end,
      })
    end,
  },
}
