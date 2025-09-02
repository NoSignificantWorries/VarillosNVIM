vim.g.mapleader = " "

-- Init lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("core.options")

require("lazy").setup("plugins")

require("core.keymaps")


if vim.g.vscode then
    local vscode = {
        action = function(method, params)
            vim.fn.VSCodeNotify(method, params.args)
        end
    }

    -- local vscode = require("vscode")

    local function notify_vscode_mode()
        local mode = vim.api.nvim_get_mode().mode
        local mode_name = ""
        -- Convert Neovim mode to readable name
        if mode == "n" then
            mode_name = "normal"
        elseif mode == "i" then
            mode_name = "insert"
        elseif mode == "v" then
            mode_name = "visual"
        elseif mode == "V" then
            mode_name = "visual"
        elseif mode == "\22" then
            mode_name = "visual"
        elseif mode == "c" then
            mode_name = "cmdline"
        elseif mode == "R" then
            mode_name = "replace"
        else
            mode_name = mode
        end
        --  Call VSCode extension to update UI asynchronously
        vscode.action("nvim-ui-plus.setMode", {
            args = { mode = mode_name }
        })
    end

    -- Mode change notification autocmd
    vim.api.nvim_create_autocmd("ModeChanged", {
        pattern = "*",
        callback = notify_vscode_mode,
    })
end

