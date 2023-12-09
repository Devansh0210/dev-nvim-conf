-- Utilities for creating configurations
local util = require "formatter.util"

-- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
require("formatter").setup {
  -- Enable or disable logging
  logging = true,
  -- Set the log level
  log_level = vim.log.levels.WARN,
  -- All formatter configurations are opt-in
  filetype = {
    -- Formatter configurations for filetype "lua" go here
    -- and will be executed in order
    verilog = {

      function()
        return {
          exe = "verible-verilog-format",
          args = {
            "--indentation_spaces 4",
            "--indentation_spaces 4",
            "--assignment_statement_alignment=align",
            "--case_items_alignment=align",
            "--module_net_variable_alignment=align",
            "--named_parameter_alignment=align",
            "--named_port_alignment=align",
            "--column_limit=200",
            "--formal_parameters_alignment=align",
            "--formal_parameters_indentation=indent",
            "--port_declarations_alignment=align",
            "-"
          },
          stdin = true,
        }
      end
    },
  

    systemverilog = {

        function()
            return {
                exe = "verible-verilog-format",
                args = {
                    "--indentation_spaces 4",
                    "--assignment_statement_alignment=align",
                    "--case_items_alignment=align",
                    "--module_net_variable_alignment=align",
                    "--named_parameter_alignment=align",
                    "--named_port_alignment=align",
                    "--column_limit=200",
                    "--formal_parameters_alignment=align",
                    "--formal_parameters_indentation=indent",
                    "--port_declarations_alignment=align",
                    "-"
                },
                stdin = true,
            }
        end
    }
  }
}
