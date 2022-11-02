


-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━❰ mason ❱━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- mason :
-- provides a repository and frontend that helps a user manage the installation of various third-party tools 
-- (LSP servers, formatters, linters, etc...) that can be useful when running neovim. It also provides an API for plugin developers.
-- (the 'repository' mentioned earlier is not of the tools themselves, but of configuration that details how to install each tool.)

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━❰ mason-lspconfig ❱━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- mason-lspconfig :
-- uses Mason to ensure installation of user specified LSP servers and will tell nvim-lspconfig what command to use to launch those servers.

-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━❰ nvim-lspconfig ❱━━━━━━━━━━━━━━━ --
-- ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ --
-- nvim-lspconfig :
-- provides (very) basic configurations for LSP servers, and a simpler configuration to interact with neovim.
-- One thing it does not, and cannot easily, provide is the path to the command to use when launching the server. This brings me to...



local mason_status, mason = pcall(require, "mason")
if not mason_status then
    return
end

local mason_lspconfig_status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lspconfig_status then
    return
end

local lspconfig_status, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status then
    return
end


mason.setup({
    ui = {
        icons                   = {
            package_installed   = "✓",
            package_pending     = "➜",
            package_uninstalled = "✗"
        }
    },

    keymaps                     = {
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


local server_list = {}
for server_name, _ in pairs(require("plugins.lsp.languages").servers) do
    table.insert(server_list, server_name)
end

mason_lspconfig.setup ({
    ensure_installed = server_list,

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    automatic_installation = false,
})

mason_lspconfig.setup_handlers({
    -- The first entry (without a key) will be the default handler
    -- and will be called for each installed server that doesn't have
    -- a dedicated handler.
    function(server_name)
        lspconfig[server_name].setup({})
    end,

    -- Next, you can provide targeted overrides for specific servers.
    -- For example, a handler override for the `rust_analyzer`:
})

for _, server_setup in pairs(require("plugins.lsp.languages").servers) do
    server_setup()
end


-- require("plugins.lsp.handlers.diagnostics").disable()
