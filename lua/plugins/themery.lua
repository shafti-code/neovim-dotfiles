return {
    "zaldih/themery.nvim",
    priority = 1000,
    lazy = false,

    config = function()
        require("themery").setup({
            themes = {"night-owl","catppuccin","ashen"},
            livePreview = true,
            -- add the config here
        })
    end
}

