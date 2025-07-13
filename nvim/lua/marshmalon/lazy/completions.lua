return {
  {
    'saghen/blink.cmp',
    dependencies = 'rafamadriz/friendly-snippets',

    version = 'v0.*',

    opts = {
      keymap = { 
        preset = 'default',
        ['<Tab>'] = { 'accept', 'fallback' },
        ['<CR>'] = { 'accept', 'fallback' },
        ['<C-y>'] = { 'accept' },
      },

      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono'
      },

      signature = { enabled = true }
    },
  },
}