local id = vim.api.nvim_create_augroup("au_grp_v", {
    clear = false
})

vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.v", "*.sv", "*.vh", "*.svh"},
    callback = function(ev)
        vim.diagnostic.disable(0)
    end
})
