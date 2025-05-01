return {
    {
        "stevearc/conform.nvim",
        opts = {
            formatters_by_ft = {
                python = { "ruff_format" },
            },
            formatters = {
                ruff_format = {
                    command = "ruff",
                    args = { "format", "--unsafe-fixes", "-" },
                    stdin = true,
                },
            },
        },
    },
    {
        "mfussenegger/nvim-lint",
        opts = {
            linters_by_ft = {
                python = { "ruff" },
            },
        },
    },
}
