-- ~/.config/nvim/lua/plugins/cmp.lua
return {

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "L3MON4D3/LuaSnip",         -- Snippet engine
            "saadparwaiz1/cmp_luasnip", -- Snippet completions
            "hrsh7th/cmp-nvim-lsp",     -- LSP completions
            "hrsh7th/cmp-buffer",       -- Buffer completions
            "hrsh7th/cmp-path",         -- Path completions
            "hrsh7th/cmp-cmdline",      -- Command line completions
            "onsails/lspkind-nvim",     -- Icons for completion menu
        },
        config = function()
            local cmp = require("cmp")
            local luasnip = require("luasnip")
            local lspkind = require("lspkind")

            require("luasnip.loaders.from_vscode").lazy_load()
            local has_words_before = function()
                local line, col = unpack(vim.api.nvim_win_get_cursor(0))
                return col ~= 0 and
                    vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
            end

            cmp.setup({
                snippet = {
                    expand = function(args)
                        luasnip.lsp_expand(args.body)
                    end,
                },
                -- Completion sources
                sources = {
                    { name = "nvim_lsp" },
                    { name = "nvim_lua" }, -- Neovim Lua completions
                    { name = "buffer" },   -- Words from current buffer
                    { name = "path" },     -- File system paths
                    { name = "luasnip" },  -- Added for snippets
                },
                -- Key mappings
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),            -- Trigger completion
                    ["<C-e>"] = cmp.mapping.abort(),                   -- Close completion
                    ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirm selection

                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            local entry = cmp.get_selected_entry()
                            if not entry then
                                -- No selection yet, move to next item
                                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                            else
                                -- Entry is selected, confirm it
                                cmp.confirm({ select = true })
                            end
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        elseif has_words_before() then
                            cmp.complete()
                        else
                            fallback()
                        end
                    end, { "i", "s" }), -- Next suggestion

                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }), -- Previous suggestion
                }),

                -- Autopairs integration
                completion = {
                    completeopt = "menu,menuone,noinsert",
                },
                formatting = {
                    fields = { "kind", "abbr", "menu" },
                    format = lspkind.cmp_format({
                        mode = "symbol_text",
                        maxwidth = 50,
                        ellipsis_char = "...",
                        menu = {
                            nvim_lsp = "[LSP]",
                            luasnip = "[Snippet]",
                            nvim_lua = "[Lua]",
                            buffer = "[Buffer]",
                            path = "[Path]",
                            window = {
                                completion = cmp.config.window.bordered(),
                                documentation = cmp.config.window.bordered(),
                            },
                        },
                    }),
                },
            })

            -- Commandline Completion
            cmp.setup.cmdline(":", {
                mapping = cmp.mapping.preset.cmdline(),
                sources = { { name = "cmdline" } },
            })

            cmp.setup.cmdline({ "/", "?" }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = { { name = "buffer" } },
            })
            -- Autopairs hook
            local cmp_autopairs = require("nvim-autopairs.completion.cmp")
            cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
        end,
    },
}
