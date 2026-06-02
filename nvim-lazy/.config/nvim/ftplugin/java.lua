-- ~/.config/nvim/ftplugin/java.lua

local jdtls = require('jdtls')

-- 1. Project Detection & Root Directory Setup
local root_markers = { '.git', 'mvnw', 'gradlew', 'pom.xml', 'build.gradle' }
local root_dir = vim.fs.root(0, root_markers)

if root_dir == "" then
    return
end

-- 2. Workspace Management
local project_name = vim.fs.basename(root_dir)
local workspace_dir = vim.fn.stdpath('data') .. '/jdtls-workspace/' .. project_name

-- 3. Capability Syncing
local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- ============================================================================
-- DEBUGGER BUNDLE DETECTION (NEW)
-- ============================================================================
-- Dynamically unrolls the downloaded mason java-debug-adapter runtime jars
local bundles = {}
local mason_registry = require("mason-registry")

if mason_registry.is_installed("java-debug-adapter") then
    local pkg = mason_registry.get_package("java-debug-adapter")
    local install_path = pkg:get_install_path()
    local jar_patterns = install_path .. "/extension/server/com.microsoft.java.debug.plugin-*.jar"
    for _, jar in ipairs(vim.fn.glob(jar_patterns, true, true)) do
        table.insert(bundles, jar)
    end
end
-- ============================================================================

-- 4. Enterprise Configuration Options
local config = {
    cmd = {
        'jdtls',
        '-data', workspace_dir
    },
    root_dir = root_dir,
    capabilities = capabilities,

    settings = {
        java = {
            signatureHelp = { enabled = true },
            contentProvider = { preferred = 'fernflower' },
            completion = {
                favoriteStaticMembers = {
                    "org.hamcrest.MatcherAssert.assertThat",
                    "org.junit.jupiter.api.Assertions.*",
                    "org.mockito.Mockito.*"
                },
            },
            sources = {
                organizeImports = { starThreshold = 9999, staticStarThreshold = 9999 },
            },
        }
    },

    init_options = {
        bundles = bundles, -- FIX: Passes the discovered debugger jars directly to eclipse.jdt.ls
        extendedClientCapabilities = jdtls.extendedClientCapabilities,
    },
}

-- Add a keymap helper specifically for booting the Java debugger configuration manually inside a buffer
vim.keymap.set('n', '<leader>jc', function() require('jdtls').test_class() end,
    { buffer = true, desc = "Java: Debug Test Class" })
vim.keymap.set('n', '<leader>jm', function() require('jdtls').test_nearest_method() end,
    { buffer = true, desc = "Java: Debug Nearest Method" })

-- Initialize or attach to an existing server instance
jdtls.start_or_attach(config)
