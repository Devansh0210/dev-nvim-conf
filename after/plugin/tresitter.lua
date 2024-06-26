require("nvim-treesitter.install").prefer_git = true
vim.env.CC = 'gcc'
vim.env.CFLAGS = '-std=c99'

-- print(vim.fn.getenv("CC"))
-- local ex_vim = 
require("nvim-treesitter.install").compilers =  {"gcc"}
-- print(vim.inspect(ex_vim));


require'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "vim", "verilog", "python", "bash", "vimdoc", "c", "lua", "rust" },
    --
    --     -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,
    --
    --         -- Automatically install missing parsers when entering buffer
    --           -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = false,
    highlight = {
        --                   -- `false` will disable the whole extension
        disable = {"verilog", "systemverilog"},
        -- disable = {"verilog", "systemverilog"},
        enable = true,
        --
        --                           -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        --                               -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        --                                   -- Using this option may slow down your editor, and you may see some duplicate highlights.
        --                                       -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
}
