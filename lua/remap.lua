
local nnoremap = require("keymap").nnoremap
local vnoremap = require("keymap").vnoremap
local tnoremap = require("keymap").tnoremap

vim.g.BASH_Ctrl_j = 'on'


-- Split movement
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")
nnoremap("<C-q>", "<C-w>q")

-- Tab movement
nnoremap("<S-h>", ":tabp<CR>")
nnoremap("<S-l>", ":tabn<CR>")
-- nnoremap(">", ":tabn<CR>")
-- nnoremap(">", ":tabn<CR>")
nnoremap(">", ":bnext<CR>")
nnoremap("<", ":bprevious<CR>")



nnoremap("<C-Down>", ":resize -2 <CR>")
nnoremap("<C-Up>", ":resize +2 <CR>")
nnoremap("<C-Left>", ":vertical resize -2 <CR>")
nnoremap("<C-Right>", ":vertical resize +2 <CR>")



vim.g.mapleader = ","
vim.keymap.set("n", "<leader>eq", vim.cmd.Ex)
-- nmap <silent> <leader>p :set paste<CR>"*p:set nopaste<CR>
vim.keymap.set("n", "<leader>p", function()
    vim.cmd([[nmap <silent> <leader>p :set paste<CR>"*p:set nopaste<CR>]])
end)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", ":Format<CR>") 
vim.keymap.set("n", "<leader>F", ":FormatWrite<CR>") 

-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>q", "<cmd>!source %<CR>", {silent = true })
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "<leader>a", function ()
    vim.diagnostic.hide(nil, 0);
end)

vim.keymap.set("n", "<leader>b", function ()
    vim.diagnostic.show(nil, 0);
end)

vim.keymap.set({"v", "i", "n"}, "<C-c>", "<Esc>");

vim.keymap.set("n", ",dl", function()
    local is_lsp = vim.diagnostic.is_disabled(0);

    if (is_lsp) then
        vim.diagnostic.enable(0);
    else 
        vim.diagnostic.disable(0);
    end
        
end)

header_txt = {"//  ------------------------------------------------------------------------    //",
"//  $Source: ",
"//  ------------------------------------------------------------------------    //",
"//  Author              :   Devansh Tanna ",
"//  Date Created        :   ,2023",
"//  ------------------------------------------------------------------------    //",
"//  Last modified on    :   $Date: Thu Mar 30 18:02:54 2023 $",
"//  Last Modified by    :   $Author: a0500701 $",
"//  ------------------------------------------------------------------------    //",
"//  Description         :   Greymatter (Main State Machine)                      ",
"//  ------------------------------------------------------------------------    //"}

-- vim.keymap.set("ia", "hdr#", function()
--     local r, c = unpack(vim.api.nvim_win_get_cursor(0));
--     vim.api.nvim_buf_set_lines(0, r, r, false, header_txt);
-- end);
