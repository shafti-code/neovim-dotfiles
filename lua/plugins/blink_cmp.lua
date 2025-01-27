return {
	{
	  'saghen/blink.cmp',
	  dependencies = 'rafamadriz/friendly-snippets',

	  version = '*',

	  opts = {
	    keymap = {
		    ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
		['<C-e>'] = { 'hide', 'fallback' },
		['<CR>'] = { 'accept', 'fallback' },


		['<Tab>'] = { 'select_next', 'fallback' },
		['<S-Tab>'] = { 'select_prev', 'fallback' },
		['<C-p>'] = { 'select_prev', 'fallback' },
		['<C-n>'] = { 'select_next', 'fallback' },

		['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
		['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

		['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
	    },

	    completion = {
		list = {
			selection = { preselect = false, auto_insert = true },
		},
	    },
	    appearance = {
	      use_nvim_cmp_as_default = true,
	      nerd_font_variant = 'mono'
	    },
		signature = {enabled = true}
	  },
	},
}


