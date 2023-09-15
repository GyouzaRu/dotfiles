-- set vifmrc filetype as vim when read it
-- local api = vim.api
local term_buf_id = -1
function open_term()
  if term_buf_id == -1 then
    vim.api.nvim_command("sp term://zsh")
    term_buf_id = vim.api.nvim_get_current_buf()
  elseif term_buf_id == vim.api.nvim_get_current_buf() then
    vim.api.nvim_win_close(0,{})
  else
    vim.api.nvim_command("sp")
    vim.api.nvim_set_current_buf(term_buf_id)
  end
end


-- api.nvim_create_user_command('Cmake', function (args)
--   require('usercmds').run(args)
-- end, {nargs =1, desc = "cmake command" })
--
-- local custom_cmake = {}
--
-- function custom_cmake.run(args)
--     local build_dir = "build"
--     if args == "clean" or args == "c" or args == "C" then
--       if vim.fn.isdirectory(build_dir) == 0 then
--         print("-- Folder build is not exist")
--       else
--         vim.cmd("!rm -rf build/*")
--       end
--       return
--     end
--
--     if args == "run" or args == "r" or args == "R" then
--       if vim.fn.isdirectory(build_dir) == 0 then
--         print("-- Folder build is not exist")
--         vim.fn.mkdir("build","p")
--       end
--       vim.cmd("!cmake -B build")
--     end
-- end
--
-- return custom_cmake
