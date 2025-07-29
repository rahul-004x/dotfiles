return {
  {
    "saghen/blink.cmp",
    dependencies = "rafamadriz/friendly-snippets",
    version = "v0.*",
    
    config = function()
      -- Set up custom highlights
      local highlights = {
        -- Ghost text with faded appearance
        ["BlinkCmpGhostText"] = {
          fg = "#6c7086",
          italic = true,
          blend = 40,
        },
        -- Nice blue borders
        ["BlinkCmpMenuBorder"] = {
          fg = "#7aa2f7",
          bold = true,
        },
        ["BlinkCmpDocumentationBorder"] = {
          fg = "#7aa2f7",
          bold = true,
        },
      }
      
      -- Apply all highlights
      for group_name, style in pairs(highlights) do
        vim.api.nvim_set_hl(0, group_name, style)
      end
      
      -- Blink CMP configuration
      local options = {
        keymap = {
          preset = "default",
            -- Accept completion
            ["<Tab>"] = { "accept", "fallback" },
            ["<CR>"] = { "accept", "fallback" },
            ["<C-y>"] = { "accept" },
            ["<C-l>"] = { "accept" },
            
            -- Decline completion
            ["<C-k>"] = { "cancel", "fallback" },
          
          -- Documentation scrolling
          ["<C-f>"] = { "scroll_documentation_down", "fallback" },
          ["<C-b>"] = { "scroll_documentation_up", "fallback" },
          ["<C-d>"] = { "scroll_documentation_down", "fallback" },
          ["<C-u>"] = { "scroll_documentation_up", "fallback" },
        },
        
        appearance = {
          use_nvim_cmp_as_default = true,
          nerd_font_variant = "mono",
          kind_icons = {},
        },
        
        completion = {
          -- Auto-brackets support
          accept = {
            auto_brackets = { enabled = true },
          },
          
          -- Menu configuration
          menu = {
            draw = {
              treesitter = { "lsp" },
              padding = 1,
              gap = 1,
            },
            border = "rounded",
            winhighlight = "Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None",
          },
          
          -- Documentation window
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 200,
            window = {
              border = "rounded",
              winhighlight = "Normal:BlinkCmpDocumentation,FloatBorder:BlinkCmpDocumentationBorder,Search:None",
            },
          },
          
          -- Ghost text
          -- ghost_text = { enabled = true },
        },
        
        -- Signature help
        signature = { enabled = true },
      }
      
      require("blink.cmp").setup(options)
    end,
  },
}

