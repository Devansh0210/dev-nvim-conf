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
nnoremap("<S-h>", "<CMD>silent! tabp<CR>")
nnoremap("<S-l>", "<CMD>silent! tabn<CR>")
nnoremap(">", ":tabn<CR>")
nnoremap(">", ":tabn<CR>")

vim.g.mapleader = ","
vim.keymap.set("n", "<leader>eq", vim.cmd.Ex)
nnoremap("<C-Down>", "<CMD>silent! resize -2 <CR>")
nnoremap("<C-Up>", "<CMD>silent! resize +2 <CR>")
nnoremap("<C-Left>", "<CMD>silent! vertical resize -2 <CR>")
nnoremap("<C-Right>", "<CMD>silent! vertical resize +2 <CR>")


vnoremap(">", ":> <CR>gv")
vnoremap("<", ":< <CR>gv")
-- nmap <silent> <leader>p :set paste<CR>"*p:set nopaste<CR>
vim.keymap.set("n", "<leader>p", function()
    vim.cmd([[nmap <silent> <leader>p :set paste<CR>"*p:set nopaste<CR>]])
end)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "")
vim.keymap.set("n", "<C-d>", "<PageDown>zz")
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
vim.keymap.set("i", "<C-c>", "<Esc>:noh")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", ":Format<CR>")
vim.keymap.set("n", "<leader>F", ":FormatWrite<CR>")
vim.keymap.set("n", "<leader>L", [[<cmd>%s/\s\+$//ge<CR>]]);

-- vim.keymap.set("n", "<leader>f", function ()
--     -- vim.cmd([[%s/\s\+$//ge]]);
--     vim.cmd("Format");
-- end)
-- vim.keymap.set("n", "<leader>F", function ()
--     -- vim.cmd([[%s/\s\+$//ge]]);
--     vim.cmd("FormatWrite");
-- end)

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

vim.keymap.set("n", "_", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- vim.keymap.set("n", "<leader>a", function ()
--     vim.diagnostic.hide(nil, 0);
-- end)
--
-- vim.keymap.set("n", "<leader>b", function ()
--     vim.diagnostic.show(nil, 0);
-- end)
--
vim.keymap.set({"v", "i", "n"}, "<C-c>", "<Esc><CMD>silent! noh<CR>");

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

vim.keymap.set("ia", "hdr#", function()
    local r, c = unpack(vim.api.nvim_win_get_cursor(0));
    vim.api.nvim_buf_set_lines(0, r, r, false, header_txt);
end);


-- vim.api.nvim_create_user_command('Ot', 'tabnew oil://.', {});
-- vim.api.nvim_create_user_command('Os', 'vsplit oil://.', {});

vim.api.nvim_create_user_command('Ot', function(arg_table)
    local o_fname = arg_table.fargs[1] or "."
    vim.cmd("tabnew oil://" .. o_fname)
end,  {nargs = "?", complete = 'file_in_path'});

vim.api.nvim_create_user_command('Lbg', function(arg_table)
    vim.cmd("colorscheme github_light");
end, {nargs = "?"});

vim.api.nvim_create_user_command('Dbg', function(arg_table)
    vim.cmd("colorscheme github_dark");
end, {nargs = "?"});

vim.api.nvim_create_user_command('Os', function(arg_table)
    local o_fname = arg_table.fargs[1] or "."
    vim.cmd("vsplit oil://" .. o_fname)
end,  {nargs = "?", complete = 'file_in_path'});


function Toggle_venn()
    local venn_enabled = vim.inspect(vim.b.venn_enabled)
    if venn_enabled == "nil" then
        vim.b.venn_enabled = true
        vim.cmd[[setlocal ve=all]]
        -- draw a line on HJKL keystokes
        vim.api.nvim_buf_set_keymap(0, "n", "J", "<C-v>j:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "K", "<C-v>k:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "L", "<C-v>l:VBox<CR>", {noremap = true})
        vim.api.nvim_buf_set_keymap(0, "n", "H", "<C-v>h:VBox<CR>", {noremap = true})
        -- draw a box by pressing "f" with visual selection
        vim.api.nvim_buf_set_keymap(0, "v", "f", ":VBox<CR>", {noremap = true})
    else
        vim.cmd[[setlocal ve=]]
        vim.cmd[[mapclear <buffer>]]
        vim.b.venn_enabled = nil
    end
end
-- toggle keymappings for venn using <leader>v
vim.api.nvim_set_keymap('n', '<leader>v', ":lua Toggle_venn()<CR>", { noremap = true})

