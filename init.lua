-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local format_group = vim.api.nvim_create_augroup("PythonFormatOnSave", { clear = true })

vim.api.nvim_create_autocmd("BufWritePre", {
    group = format_group,
    pattern = "*.py",
    callback = function()
        -- Run Ruff to fix issues before saving
        vim.cmd([[silent! !ruff --fix %]])
    end,
})

local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
    cmd = {
        "clangd",
        "--header-insertion=never",
        "--log=verbose",
    },
    filetypes = { "c", "cpp", "objc", "objcpp", "hpp", "h" },
    root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"),
})

lspconfig.sourcekit.setup({
    cmd = { "sourcekit-lsp" },
    filetypes = { "swift" },
    root_dir = function(fname)
        -- Manually specify the root directory or use `root_pattern` to find one.
        return vim.fn.getcwd()
    end,
})

vim.g.snacks_animate = false
