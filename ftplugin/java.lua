-- See `:help vim.lsp.start` for an overview of the supported `config` options.
print("entered the java.lua file")

local jdtlsPath = vim.fn.expand("~/.local/share/nvim/jdtls")
local launcherJar = vim.fn.glob(jdtlsPath .. "/plugins/org.eclipse.equinox.launcher_*.jar")
local configDir = jdtlsPath .. "/config_linux"

local home = os.getenv("HOME")
local projectName = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
local workspaceDir = home .. "/.cache/jdtls/workspace/" .. projectName

-- Find the Mason-installed JDTLS paths
--local mason_registry = require("mason-registry")
--local jdtls_pkg = mason_registry.get_package("jdtls")
--local jdtlsPath = jdtls_pkg:get_install_path()

local config = {
    name = "jdtls",


    -- `cmd` defines the executable to launch eclipse.jdt.ls.
    -- `jdtls` must be available in $PATH and you must have Python3.9 for this to work.
    --
    -- As alternative you could also avoid the `jdtls` wrapper and launch
    -- eclipse.jdt.ls via the `java` executable
    -- See: https://github.com/eclipse/eclipse.jdt.ls#running-from-the-command-line
    cmd = {
        "jdtls",
        --"java",
        --"-Declipse.application=org.eclipse.jdt.ls.core.id1",
        --"-Dosgi.bundles.defaultStartLevel=4",
        --"-Declipse.product=org.eclipse.jdt.ls.core.product",
        --"-Dlog.protocol=true",
        --"-Dlog.level=ALL",
        --"-Xmx1g", -- Adjust memory as needed
        --"--add-modules=ALL-SYSTEM",
        --"--add-opens", "java.base/java.util=ALL-UNNAMED",
        --"--add-opens", "java.base/java.lang=ALL-UNNAMED",
        --"-jar", launcherJar,
        --"-configuration", configDir,
        --"-data", workspaceDir,
    },


    -- `root_dir` must point to the root of your project.
    -- See `:help vim.fs.root`
    root_dir = vim.fs.root(0, { 'gradlew', '.git', 'mvnw', 'pom.xml', 'build.gradle', '.project' }),


    -- Here you can configure eclipse.jdt.ls specific settings
    -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
    -- for a list of options
    settings = {
        java = {
            imports = {
                gradle = {
                    wrapper = {
                        checksums = {
                            sha256 = "b5173cbc1029dbe2212de0ff1c6331940f1c841bb26a0685b7189615802bf365",
                            allowed = true,
                        }
                    }
                }
            },
            signatureHelp = { enabled = true },
            contentProvider = { preferred = "fernflower" },
            completion = {
                favoriteStaticMembers = {
                    "org.hamcrest.MatcherAssert.assertThat",
                    "org.hamcrest.Matchers.*",
                    "org.junit.Assert.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "java.util.Objects.requireNonNull",
                },
            },
        }
    },


    -- This sets the `initializationOptions` sent to the language server
    -- If you plan on using additional eclipse.jdt.ls plugins like java-debug
    -- you'll need to set the `bundles`
    --
    -- See https://codeberg.org/mfussenegger/nvim-jdtls#java-debug-installation
    --
    -- If you don't plan on any eclipse.jdt.ls plugins you can remove this
    --init_options = {
    --    bundles = {}
    --},
}
require('jdtls').start_or_attach(config)
