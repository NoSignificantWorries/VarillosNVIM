return {
    {
        "nvim-treesitter/nvim-treesitter",

        build = ":TSUpdate",

        config = function()
            local config = require("nvim-treesitter.configs")
            config.setup({
                ensure_installed = {
                    "lua",
                    "vim",
                    "bash",
                    "markdown",
                    "rust",
                    "python",
                    "c",
                    "cpp",
                    "go",
                    "glsl",
                    "css",
                    "scss",
                    "html",
                    "yuck",
                    "toml",
                    "yaml",
                    "csv",
                    "json",
                    "dockerfile",
                    "gitignore",
                    "hyprlang",
                    "ssh_config",
                    "rasi",
                    "printf",
                },

                auto_install = true,
                highlight = { enable = true },
                indent = { enable = false },
            })
        end
    }
}

