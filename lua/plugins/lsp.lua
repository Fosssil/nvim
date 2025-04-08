-- ~/.config/nvim/lua/plugins/lsp.lua
return {
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- Update Mason packages
        config = function()
            require("mason").setup()
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "bashls", "cssls", "html", "lua_ls", "jsonls", "hyprls" }, -- Install these automatically
                automatic_installation = true,
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },

        config = function()
            local lspconfig = require("lspconfig")
            local capabilities = require("cmp_nvim_lsp").default_capabilities()


            -- Basic LSP servers setup
            local servers = {
                bashls = {},
                cssls = {},
                html = {},
                jsonls = {},
                hyprls = {},
                lua_ls = {
                    settings = {
                        Lua = {
                            runtime = { version = "LuaJIT" },
                            diagnostics = { globals = { "vim" } },
                            workspace = {
                                library = vim.api.nvim_get_runtime_file("", true),
                                checkThirdParty = false,
                            },
                            telemetry = { enable = false },
                        },
                    },
                },
            }

            -- Debug command to check available servers
            vim.api.nvim_create_user_command("LspInfo", function()
                print(vim.inspect(require("lspconfig").util.available_servers()))
            end, {})

            for server, config in pairs(servers) do
                lspconfig[server].setup(vim.tbl_deep_extend("force", { capabilities = capabilities }, config))
            end
        end,
    },
}
