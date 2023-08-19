

local nvim_lspconfig = function()
    local env_var                  = require("environment").env_var
    local nvim_lsp                 = require("lspconfig")
    local mason_lspconfig          = require("mason-lspconfig")
    local diagnostics_virtual_text = true
    local diagnostics_level        = "Hint"

    require("lspconfig.ui.windows").default_options.border = "rounded"

    mason_lspconfig.setup({
        ensure_installed = env_var.lsp_deps
	})


    vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        signs = false,
        underline = true,
        virtual_text = diagnostics_virtual_text and {
            severity_limit = diagnostics_level,
        } or false,
        -- set update_in_insert to false bacause it was enabled by lspsaga
        update_in_insert = false,
    })
    vim.diagnostic.disable()

    local opts = {
        capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    }

    ---A handler to setup all servers defined under `config/lsp/servers/*.lua`
	---@param lsp_name string
	local function mason_lsp_handler(lsp_name)
		local ok, custom_handler = pcall(require, "config.lsp.servers." .. lsp_name)
		if not ok then
			-- Default to use factory config for server(s) that doesn't include a spec
			nvim_lsp[lsp_name].setup(opts)
			return
		elseif type(custom_handler) == "function" then
			--- Case where language server requires its own setup
			--- Make sure to call require("lspconfig")[lsp_name].setup() in the function
			--- See `clangd.lua` for example.
			custom_handler(opts)
		elseif type(custom_handler) == "table" then
			nvim_lsp[lsp_name].setup(vim.tbl_deep_extend("force", opts, custom_handler))
		else
			vim.notify(
				string.format(
					"Failed to setup [%s].\n\nServer definition under `completion/servers` must return\neither a fun(opts) or a table (got '%s' instead)",
					lsp_name,
					type(custom_handler)
				),
				vim.log.levels.ERROR,
				{ title = "nvim-lspconfig" }
			)
		end
	end
    mason_lspconfig.setup_handlers({ mason_lsp_handler })

    vim.api.nvim_command([[LspStart]])
end


local mason_config = function()
    require("mason").setup({
        ui = {
            icons = {
                package_installed   = "✓",
                package_pending     = "➜",
                package_uninstalled = "✗",
            },
        },

        keymaps = {
            -- Keymap to expand a package
            toggle_package_expand   = "<CR>",
            -- Keymap to install the package under the current cursor position
            install_package         = "i",
            -- Keymap to reinstall/update the package under the current cursor position
            update_package          = "u",
            -- Keymap to check for new version for the package under the current cursor position
            check_package_version   = "c",
            -- Keymap to update all installed packages
            update_all_packages     = "U",
            -- Keymap to check which installed packages are outdated
            check_outdated_packages = "C",
            -- Keymap to uninstall a package
            uninstall_package       = "x",
            -- Keymap to cancel a package installation
            cancel_installation     = "<C-c>",
            -- Keymap to apply language filter
            apply_language_filter   = "<C-f>",
        },
    })
end


local glance_config = function()
	local glance = require("glance")
	local actions = glance.actions

	glance.setup({
		height = 20,
		zindex = 50,

		preview_win_opts = {
			cursorline = true,
			number     = true,
			wrap       = true,
		},

		border = {
			enable = true, -- Show window borders. Only horizontal borders allowed
			top_char = "―",
			bottom_char = "―",
		},

		list = {
			position = "right",
			width    = 0.33, -- 33% width relative to the active window, min 0.1, max 0.5
		},

		folds = {
			folded      = true, -- Automatically fold list on startup
			fold_closed = "",
			fold_open   = "",
		},

		indent_lines = {
            enable = true
        },

		winbar = {
            enable = true
        },

		mappings = {
			list = {
				["k"]       = actions.previous,
				["j"]       = actions.next,
				["<Up>"]    = actions.previous,
				["<Down>"]  = actions.next,
				["<S-Tab>"] = actions.previous_location, -- Bring the cursor to the previous location skipping groups in the list
				["<Tab>"]   = actions.next_location, -- Bring the cursor to the next location skipping groups in the list
				["<C-u>"]   = actions.preview_scroll_win(8),
				["<C-d>"]   = actions.preview_scroll_win(-8),
				["<CR>"]    = actions.jump,
				["v"]       = actions.jump_vsplit,
				["s"]       = actions.jump_split,
				["t"]       = actions.jump_tab,
				["c"]       = actions.close_fold,
				["o"]       = actions.open_fold,
				["[]"]      = actions.enter_win("preview"), -- Focus preview window
				["q"]       = actions.close,
				["Q"]       = actions.close,
				["<Esc>"]   = actions.close,
				["gq"]      = actions.quickfix,
			},
			preview = {
				["Q"]      = actions.close,
				["<C-c>q"] = actions.close,
				["<C-c>o"] = actions.jump,
				["<C-c>v"] = actions.jump_vsplit,
				["<C-c>s"] = actions.jump_split,
				["<C-c>t"] = actions.jump_tab,
				["<C-p>"]  = actions.previous_location,
				["<C-n>"]  = actions.next_location,
				["[]"]     = actions.enter_win("list"), -- Focus list window
			},
		},

		hooks = {
			before_open = function(results, open, _, method)
				if #results == 0 then
					vim.notify(
						"This method is not supported by any of the servers registered for the current buffer",
						vim.log.levels.WARN,
						{ title = "Glance" }
					)
				elseif #results == 1 and method == "references" then
					vim.notify(
						"The identifier under cursor is the only one found",
						vim.log.levels.INFO,
						{ title = "Glance" }
					)
				else
					open(results)
				end
			end,
		},
	})
end


return {
    -- Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
    {
        "folke/neodev.nvim",
        ft = { "lua" },
        config = function()
            require("neodev").setup({
                -- add any options here, or leave empty to use the default settings
                library = {
                    enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
                    -- these settings will be used for your Neovim config directory
                    runtime = true, -- runtime path
                    types   = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
                    plugins = true, -- installed opt or start plugins in packpath
                    -- you can also specify the list of plugins to make available as a workspace library
                    -- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
                },

                setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files

                -- for your Neovim config directory, the config.library settings will be used as is
                -- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
                -- for any other directory, config.library.enabled will be set to false
                override = function(root_dir, options) end,

                -- With lspconfig, Neodev will automatically setup your lua-language-server
                -- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
                -- in your lsp start options
                lspconfig = true,
            })
        end,
        enabled = true,
    },

    -- Quickstart configs for Nvim LSP
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        event = "BufRead",
        config = nvim_lspconfig,

        dependencies = {
            {
                "williamboman/mason.nvim",
                config = mason_config,
            },

            { "williamboman/mason-lspconfig.nvim" },
        },
    },


    -- A pretty window for previewing, navigating and editing your LSP locations in one place, inspired by vscode's peek preview.
    {
        "DNLHC/glance.nvim",
        event = { "LspAttach" },
        cmd = { "Glance" },
        config = glance_config,
    },
}
