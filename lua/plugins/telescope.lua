return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    keys = {
        {
            "<leader>sB",
            function()
                require("telescope").extensions.file_browser.file_browser({
                    path = vim.fn.expand("%:p:h"),
                })
            end,
            desc = "Browse files",
        },
    },
    config = function()
        require("telescope").load_extension("file_browser")
    end,
}
