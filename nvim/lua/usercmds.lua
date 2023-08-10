-- set vifmrc filetype as vim when read it
local api = vim.api

api.nvim_create_user_command('Cmake', function (args)
  require('usercmds').run(args)
end, {nargs =1, desc = "cmake command" })

local custom_cmake = {}

function custom_cmake.run(args)
    local build_dir = "build"
    if args == "clean" or args == "c" or args == "C" then
      if vim.fn.isdirectory(build_dir) == 0 then
        print("-- Folder build is not exist")
      else
        vim.cmd("!rm -rf build/*")
      end
      return
    end

    if args == "run" or args == "r" or args == "R" then
      if vim.fn.isdirectory(build_dir) == 0 then
        print("-- Folder build is not exist")
        vim.fn.mkdir("build","p")
      end
      vim.cmd("!cmake -B build")
    end
end

return custom_cmake
