-- import config here!
require("config.keymaps")
require("config.options")


-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)


-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  install = { colorscheme = { "habamax" } },
  checker = { enabled = true },
})



-- run custom rust unit-test
function RunCurrentRustTest()
  -- Get the current line under the cursor
  local line = vim.fn.getline(".")
  -- Try to match the function name (Rust test functions)
  local func_name = string.match(line, "fn%s+([%w_]+)%s*%(")
  if not func_name then
    print("No function name found on this line.")
    return
  end

  -- Build the cargo test command
  local cmd = "cargo test " .. func_name .. " -- --nocapture"
  -- Open terminal and run the command
  vim.cmd("split | terminal " .. cmd)
end

vim.keymap.set("n", "<leader>rt", RunCurrentRustTest, { desc = "Run Rust test under cursor" })

