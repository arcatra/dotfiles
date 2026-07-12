return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp", -- Engine capabilities hook
			"hrsh7th/nvim-cmp", -- Completion engine framework
			"hrsh7th/cmp-buffer", -- Suggest words from current buffer text
			"hrsh7th/cmp-path", -- File path completions
			"saadparwaiz1/cmp_luasnip", -- Snippets link engine
			"onsails/lspkind.nvim", -- Pictogram icons for dropdown items
			{
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",
				dependencies = { "rafamadriz/friendly-snippets" },
			},
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local lspkind = require("lspkind")

			-- Load friendly snippets
			require("luasnip.loaders.from_vscode").lazy_load()

			-- 1. Initialize Mason package manager
			mason.setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			})

			-- 2. Sync Completion Capabilities safely
			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- 3. Setup Mason-LSPConfig bridges (with modern inline handlers API)
			mason_lspconfig.setup({
				ensure_installed = {
					-- Core languages
					"pyright",
					"jdtls",
					"clangd",
					"bashls",
					"sqlls",
					"lua_ls",
					"gopls", -- Go Language Server
					"zls", -- Zig Language Server

					-- Web Dev Stack
					"ts_ls", -- TypeScript / JavaScript / React (JSX/TSX)
					"html", -- HTML
					"cssls", -- CSS
					"tailwindcss", -- Tailwind CSS (highly recommended for modern React)
				},
				automatic_installation = true,
				handlers = {
					-- Default handler configured for all servers
					function(server_name)
						-- Skip explicit setup for 'jdtls' because nvim-jdtls manages Java
						if server_name ~= "jdtls" then
							lspconfig[server_name].setup({
								capabilities = capabilities,
							})
						end
					end,

					-- Targeted override for Lua language server configurations
					["lua_ls"] = function()
						lspconfig.lua_ls.setup({
							capabilities = capabilities,
							settings = {
								Lua = {
									diagnostics = { globals = { "vim" } },
									workspace = {
										library = vim.api.nvim_get_runtime_file("", true),
										checkThirdParty = false,
									},
								},
							},
						})
					end,
					["clangd"] = function()
						lspconfig.clangd.setup({
							capabilities = capabilities,
							cmd = {
								"clangd",
								"--fallback-style={BasedOnStyle: LLVM, IndentWidth: 4, TabWidth: 4}",
							},
						})
					end,
				},
			})

			-- ============================================================================
			-- REAL-TIME LSP DIAGNOSTICS HIGHLIGHTING CONFIGURATION
			-- ============================================================================

			-- Define diagnostic signs/icons in the gutter
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- Configure global diagnostic presentation properties
			vim.diagnostic.config({
				-- Show virtual text inline right next to the code line where the issue exists
				virtual_text = {
					spacing = 4,
					prefix = "●", -- Simple elegant dot indicator
				},
				-- Use undercurls/underlines on the code itself
				underline = true,
				-- Update diagnostics while typing in Insert mode (instead of waiting for save)
				update_in_insert = true,
				severity_sort = true,
				float = {
					focused = false,
					style = "minimal",
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})

			-- 4. Unified Completion Menu Properties
			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({
						select = false,
						behavior = cmp.ConfirmBehavior.Replace,
					}),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer" },
					{ name = "path" },
				}),
				formatting = {
					format = lspkind.cmp_format({
						maxwidth = 50,
						ellipsis_char = "...",
					}),
				},
			})
		end,
	},
}
