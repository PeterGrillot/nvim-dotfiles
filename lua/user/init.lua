-- AstroNvim Custom Configuration Table
local config = {
        -- colorscheme = "neodark",
        -- colorscheme = "catppuccin",
        --colorscheme = "sonokai",
        colorscheme = "tokyonight",

        -- Configure AstroNvim updates
        -- TODO: Fix when this is updated
        -- updater = {
        --         remote = "origin", -- remote to use
        --         channel = "stable", -- "stable" or "nightly"
        --         version = "latest", -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
        --         branch = "main", -- branch name (NIGHTLY ONLY)
        --         commit = nil, -- commit hash (NIGHTLY ONLY)
        --         pin_plugins = nil, -- nil, true, false (nil will pin plugins on stable only)
        --         skip_prompts = false, -- skip prompts about breaking changes
        --         show_changelog = true, -- show the changelog after performing an update
        --         auto_reload = false, -- automatically reload and sync packer after a successful update
        --         auto_quit = false, -- automatically quit the current session after a successful update
        --         -- remotes = { -- easily add new remotes to track
        --         --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
        --         --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
        --         --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
        --         -- },
        -- },
        -- Add highlight groups in any theme
        highlights = {
                tokyonight = { -- this table overrides highlights in all themes
                        Normal = { bg = "#15171f" },
                        DashboardHeader = { fg = "#77edaa" },
                        DashboardCenter = { fg = "#77edaa" },
                        StatusLine = { fg = "#5E4daa", bg = "#222222" },
                }
        },

        -- set vim options here (vim.<first_key>.<second_key> = value)
        options = {
                opt = {
                        -- set to true or false etc.
                        relativenumber = false, -- sets vim.opt.relativenumber
                        number = true, -- sets vim.opt.number
                        spell = false, -- sets vim.opt.spell
                        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
                        wrap = false, -- sets vim.opt.wrap
                },
                g = {
                        mapleader = " ", -- sets vim.g.mapleader
                        autoformat_enabled = true, -- enable or disable auto formatting at start (lsp.formatting.format_on_save must be enabled)
                        cmp_enabled = true, -- enable completion at start
                        autopairs_enabled = true, -- enable autopairs at start
                        diagnostics_enabled = true, -- enable diagnostics at start
                        status_diagnostics_enabled = true, -- enable diagnostics in statusline
                        icons_enabled = true, -- disable icons in the UI (disable if no nerd font is available, requires :PackerSync after changing)
                        ui_notifications_enabled = true, -- disable notifications when toggling UI elements
                        sonokai_style = "shusia",
                },
        },

        -- Set dashboard header
        header = {
                "                                         _.oo. ",
                "                 _.u[[/;:,.         .odMMMMMM' ",
                "              .o888UU[[[/;:-.  .o@P^    MMM^   ",
                "             oN88888UU[[[/;::-.        dP^     ",
                "            dNMMNN888UU[[[/;:--.   .o@P^       ",
                "           ,MMMMMMN888UU[[/;::-. o@^           ",
                "  █▀▀▄ █▀▀ ▀█▀ █▀▀▄8▄▀▀▄ █▀▀▄ █   █  ▀  █▀▄▀█  ",
                "  █▄▄█ ▀▀▄ 8█8 █▄▄▀U█[ █ █[/█:-█▄█   █▀ █ ▀ █  ",
                "  ▀  ▀ ▀▀▀oI▀8 ▀ ▀▀[o▀▀;:▀--▀-  ▀   ▀▀▀ ▀   ▀  ",
                "       .@^  YUU[[[/o@^;::---..                 ",
                "     oMP     ^/o@P^;:::---..                   ",
                "  .dMMM    .o@^ ^;::---...                     ",
                " dMMMMMMM@^`       `^^^^                       ",
                "YMMMUP^                                        ",
                " ^^                                            ",
        },

        -- Default theme configuration
        default_theme = {
                -- Modify the color palette for the default theme
                colors = {
                },
                highlights = function(hl) -- or a function that returns a new table of colors to set
                        -- local C = require "default_theme.colors"
                        hl.DiagnosticError.italic = true
                        hl.DiagnosticHint.italic = true
                        hl.DiagnosticInfo.italic = true
                        hl.DiagnosticWarn.italic = true

                        return hl
                end,
                -- enable or disable highlighting for extra plugins
                plugins = {
                        aerial = true,
                        beacon = false,
                        bufferline = true,
                        cmp = true,
                        dashboard = true,
                        highlighturl = true,
                        hop = false,
                        indent_blankline = true,
                        lightspeed = false,
                        ["neo-tree"] = true,
                        notify = true,
                        ["nvim-tree"] = false,
                        ["nvim-web-devicons"] = true,
                        rainbow = true,
                        symbols_outline = false,
                        telescope = true,
                        treesitter = true,
                        vimwiki = false,
                        ["which-key"] = true,
                },
        },

        -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
        diagnostics = {
                virtual_text = true,
                underline = true,
        },

        -- Extend LSP configuration
        lsp = {
                -- enable servers that you already have installed without mason
                servers = {
                        -- "pyright"
                },
                formatting = {
                        -- control auto formatting on save
                        format_on_save = {
                                enabled = true, -- enable or disable format on save globally
                                allow_filetypes = { -- enable format on save for specified filetypes only
                                        -- "go",
                                },
                                ignore_filetypes = { -- disable format on save for specified filetypes
                                        -- "python",
                                },
                        },
                        disabled = { -- disable formatting capabilities for the listed language servers
                                -- "sumneko_lua",
                        },
                        timeout_ms = 1000, -- default format timeout
                        -- filter = function(client) -- fully override the default formatting function
                        --   return true
                        -- end
                },
                -- easily add or disable built in mappings added during LSP attaching
                mappings = {
                        n = {
                                -- ["<leader>lf"] = false -- disable formatting keymap
                        },
                },
                -- Add overrides for LSP server settings, the keys are the name of the server
                ["server-settings"] = {
                        -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
                },
        },

        -- Keymappings
        mappings = {
                n = {
                        -- second key is the lefthand side of the map
                        ["<leader>bb"] = { "<cmd>tabnew<cr>", desc = "New tab" },
                        ["<leader>bc"] = { "<cmd>BufferLinePickClose<cr>", desc = "Pick to close" },
                        ["<leader>bj"] = { "<cmd>BufferLinePick<cr>", desc = "Pick to jump" },
                        ["<leader>bt"] = { "<cmd>BufferLineSortByTabs<cr>", desc = "Sort by tabs" },
                        ["<C-s>"] = { ":w!<cr>", desc = "Save File" },
                        ["<S-Up>"] = { ":m-2<cr>", desc = "Move Up" },
                        ["<S-Down>"] = { ":m+1<cr>", desc = "Move Down" },
                        ["<C-d>"] = { "yyp", desc = "Dupe Down" },
                        ["r"] = { "<C-R>", desc = "Redo" },
                        ["<S-j>"] = { ":set invwrap<cr>", desc = "Toggle Wrap" },
                },
                t = {
                        -- setting a mapping to false will disable it
                        -- ["<esc>"] = false,
                },
        },

        -- Configure plugins
        plugins = {
                init = {
                        -- You can disable default plugins as follows:
                        -- ["rebelot/heirline.nvim"] = { disable = true },

                        -- Plugins
                        { "folke/tokyonight.nvim" },
                        { "sainnhe/sonokai" },
                        {
                                "catppuccin/nvim",
                                as = "catppuccin",
                                config = function()
                                        require("catppuccin").setup {}
                                end,
                        },
                        {
                                "VDuchauffour/neodark.nvim",
                                as = "neodark",
                                config = function()
                                        require("neodark").setup({
                                                theme_style = "neodarker"
                                        })
                                end,
                        },
                        { "leafgarland/typescript-vim" },
                        { "neoclide/vim-jsx-improve" },
                        { "f-person/git-blame.nvim" },
                        -- {
                        --         "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
                        --         config = function()
                        --                 require("lsp_lines").setup()
                        --         end,
                        -- }
                },
                -- All other entries override the require("<key>").setup({...}) call for default plugins
                ["null-ls"] = function(config) -- overrides `require("null-ls").setup(config)`
                        -- config variable is the default configuration table for the setup function call
                        config.sources = {
                                -- Set a formatter
                                -- null_ls.builtins.formatting.prettier,
                        }
                        return config -- return final config table
                end,
                treesitter = { -- overrides `require("treesitter").setup(...)`
                        -- ensure_installed = { "lua" },
                },
                -- use mason-lspconfig to configure LSP installations
                ["mason-lspconfig"] = { -- overrides `require("mason-lspconfig").setup(...)`
                        -- ensure_installed = { "sumneko_lua" },
                },
                -- use mason-null-ls to configure Formatters/Linter installation for null-ls sources
                ["mason-null-ls"] = { -- overrides `require("mason-null-ls").setup(...)`
                        -- ensure_installed = { "prettier", "stylua" },
                },
                ["mason-nvim-dap"] = { -- overrides `require("mason-nvim-dap").setup(...)`
                        -- ensure_installed = { "python" },
                },
                ["neo-tree"] = {
                        filesystem = {
                                filtered_items = {
                                        visible = true,
                                        hide_dotfiles = false,
                                        hide_gitignore = false,
                                        never_show = {
                                                ".DS_Store"
                                        }
                                }
                        }
                }
        },

        -- LuaSnip Options
        luasnip = {
                -- Extend filetypes
                filetype_extend = {
                        -- javascript = { "javascriptreact" },
                },
                -- Configure luasnip loaders (vscode, lua, and/or snipmate)
                vscode = {
                        -- Add paths for including more VS Code style snippets in luasnip
                        paths = {},
                },
        },

        -- CMP Source Priorities
        -- higher value == higher priority
        -- The value can also be set to a boolean for disabling default sources
        cmp = {
                source_priority = {
                        nvim_lsp = 1000,
                        luasnip = 750,
                        buffer = 500,
                        path = 250,
                },
        },

        -- Modify which-key registration (Use this with mappings table in the above.)
        ["which-key"] = {
                -- Add bindings which show up as group name
                register = {
                        -- first key is the mode, n == normal mode
                        n = {
                                -- second key is the prefix, <leader> prefixes
                                ["<leader>"] = {
                                        -- third key is the key to bring up next level and its displayed
                                        -- group name in which-key top level menu
                                        ["b"] = { name = "Buffer" },
                                },
                        },
                },
        },

        -- This function is run last
        -- anything that doesn't fit in the normal config locations above can go here
        polish = function()
                -- Set up custom filetypes
                -- vim.filetype.add {
                --   extension = {
                --     foo = "fooscript",
                --   },
                --   filename = {
                --     ["Foofile"] = "fooscript",
                --   },
                --   pattern = {
                --     ["~/%.config/foo/.*"] = "fooscript",
                --   },
                -- }
                vim.api.nvim_create_autocmd("FileType", {
                        pattern = { "markdown", "txt" },
                        callback = function()
                                vim.wo.spell = true
                                vim.wo.wrap = true;
                                vim.opt.linebreak = true;
                        end,
                })
        end,
}

return config
