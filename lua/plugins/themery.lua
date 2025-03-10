return {
    "zaldih/themery.nvim",
    priority = 1000,
    lazy = false,

    config = function()
        require("themery").setup({
            themes = {"night-owl","rose-pine","ashen"},
            livePreview = true,
            -- add the config here
        })
    end
}

