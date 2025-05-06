return {
  {
    'panghu-huang/theme-picker.nvim',
    lazy = false,
    opts = {
      -- Options passed to Telescope
      picker = {
        layout_config = {
          width = 0.35,
          height = 0.5,
        },
        -- ...
      },
      themes = {
        {
          name = 'gruvbox',
          colorscheme = 'gruvbox',
        },
        {
            name = 'cat',
            colorscheme = 'catppuccin',
        },
      }
    },
  },
}
