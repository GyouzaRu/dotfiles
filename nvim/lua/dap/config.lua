local status, dap = pcall(require, "dap")
if not status then
  vim.notify("没有找到 dap")
  return
end

local status, dapui = pcall(require, "dapui")
if not status then
  vim.notify("没有找到 dapui")
  return
end

local status, daptxt = pcall(require, "nvim-dap-virtual-text")
if not status then
  vim.notify("没有找到 dap virtual text")
  return
end

local M = {}

local dap_breakpoint = {
    error = {
        text = "",
        texthl = "DapBreakpoint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
    },
    condition = {
        text = 'ﳁ',
        texthl = 'DapBreakpoint',
        linehl = 'DapBreakpoint',
        numhl = 'DapBreakpoint',
    },
    rejected = {
        text = "",
        texthl = "DapBreakpint",
        linehl = "DapBreakpoint",
        numhl = "DapBreakpoint",
    },
    logpoint = {
        text = '',
        texthl = 'DapLogPoint',
        linehl = 'DapLogPoint',
        numhl = 'DapLogPoint',
    },
    stopped = {
        text = '',
        texthl = 'DapStopped',
        linehl = 'DapStopped',
        numhl = 'DapStopped',
    },
}

vim.fn.sign_define('DapBreakpoint', dap_breakpoint.error)
vim.fn.sign_define('DapBreakpointCondition', dap_breakpoint.condition)
vim.fn.sign_define('DapBreakpointRejected', dap_breakpoint.rejected)
vim.fn.sign_define('DapLogPoint', dap_breakpoint.logpoint)
vim.fn.sign_define('DapStopped', dap_breakpoint.stopped)

-- dap ui
local function config_dapui()
    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open({})
    end

    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close({})
    end


    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close({})
    end
    -- dap.defaults.fallback.terminal_win_cmd = "30vsplit new"
end

-- nvim virtual txt
daptxt.setup({
    enabled = true,
    enable_commands = true,
    highlight_changed_variables = true,
    highlight_new_as_changed = false,
    show_stop_reason = true,
    commented = false,
    only_first_definition = true,
    all_references = false,
    filter_references_pattern = '<module',
    virt_text_pos = 'eol',
    all_frames = false,
    virt_lines = false,
    virt_text_win_col = nil
})


local function config_debuggers()
    require("cpp")

end

function M.setup()
    dap_breakpoint()
    config_dapui()
    config_debuggers()
end

return M
