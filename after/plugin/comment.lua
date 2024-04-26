require('Comment').setup({
      ignore = nil,
      toggler = { block = 'gcc', line = '<C-_>' },
      opleader = { block = 'gc', line = '<C-_>' },
})


local ft = require('Comment.ft')

ft({'verilog', 'systemverilog'}, {'//%s', '/*%s*/'})
