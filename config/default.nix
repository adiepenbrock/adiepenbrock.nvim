{pkgs, ...}: {
  imports = [
  ];


  config = {
	globals.mapLeader = " ";
	globals.mapLocalLeader = " ";

	opts = {
		number = true;
		relativenumber = true;
		 
		tabstop = 4;
		softtabstop = -1;
		shiftwidth = 4;
		expandtab = true;

		mouse = "a";

		clipboard = "unnamedplus";

		breakindent = true;

		ignorecase = true;
		smartcase = true;

		signcolumn = "yes";

		updatetime = 250;
		timeoutlen = 300;

		inccommand = "split";

		cursorline = true;

		scrolloff = 10;

		hlsearch = true;
	};

	colorschemes = {
		catppuccin = {
			enable = true;
			flavour = "frappe";
			integrations = {
				cmp = true;
				noice = true;
				gitsigns = true;
				which_key = true;
				treesitter = true;
				treesitter_context = true;
			 };
		};
	};

	keymaps = [
		{ 
			mode = "n";
			key = "<Esc>";
			action = "<cmd>nohlsearch<CR>";
		}
		{
			mode = "n";
			key = "<leader>e";
			action = "vim.diagnostic.open_float";
			options = {
				desc = "Show diagnostic [E]rror messages";
			};
		}
		{
			mode = "n";
			key = "<leader>ut";
			action = "<cmd>UndotreeToggle<CR>";
			options = {
				silent = true;
				desc = "[U]ndo [T]ree";
			};
		}
	];

	plugins = {
		comment = {
			enable = true;
		};

		conform-nvim = {
			enable = true;
			formatOnSave = {
				lspFallback = true;
				timeoutMs = 500;
			};
			notifyOnError = true;
			formattersByFt = {
				html = [["prettierd" "prettier"]];
				javascript = [["prettierd" "prettier"]];
				javascriptreact = [["prettierd" "prettier"]];
				typescript = [["prettierd" "prettier"]];
				typescriptreact = [["prettierd" "prettier"]];
				lua = ["stylua"];
				nix = ["alejandra"];
				markdown = [["prettierd" "prettier"]];
				yaml = [["yamllint" "yamlfmt"]];
				go = [["goimports" "gofmt"]];
				rust = ["rustfmt"];
			};
		};

		which-key = {
			enable = true;
		};

		undotree = {
			enable = true;
			settings = {
				autoOpenDiff = true;
				focusOnToggle = true;
			};
		};

		lualine = {
			enable = true;
			globalstatus = true;

			componentSeparators = {
				left = "";
				right = " ";
			};
			sectionSeparators = {
				left = "";
				right = "";
			};
			sections = {
				lualine_a = [
                    {
                        name = "mode";
						icon = "";
						separator = {
							left = "";
							right = "";
						};
					}
				];
				lualine_b = [
					{
						name = "branch";
						icon = "";
						separator = {
							left = "";
							right = "";
						};
						color = {
							fg = "#1c1d21";
							bg = "#7d83ac";
						};
					}
				];
				lualine_c = [
					{
						name = "diagnostic";
						extraConfig = {
							symbols = {
							error = " ";
							warn = " ";
							info = " ";
							hint = "󰝶 ";
							};
						};
					}
					{
						name = "filetype";
						separator = {
							left = "";
							right = "";
						};
						extraConfig = {
							icon_only = true;
							padding = {
							left = 1;
							right = 0;
							};
						};
					}
					{
						name = "filename";
						extraConfig = {
							symbols = {
							modified = "  ";
							readonly = "";
							unnamed = "";
							};
						};
					}
				];
				lualine_y = [
					{
						name = "progress";
						icon = "";
						color = {
							fg = "#1c1d21";
							bg = "#f2cdcd";
						};
					}
				];
				lualine_z = [
					{
						name = "location";
						color = {
							fg = "#1c1d21";
							bg = "#f2cdcd";
						};
					}
				];
			};
		};

		gitsigns = {
			enable = true;
			settings = {
				trouble = true;
				current_line_blame = true;

				signs = {
					add = { text = "+"; };
					change = { text = "~"; };
					topdelete = { text = "‾"; };
					changedelete = { text = "~"; };
				};
			};
		};

		todo-comments = {
			enable = true;
			signs = false;
		};

		noice = {
			enable = true;
			notify = {
				enabled = false;
			};
			messages = {
				enabled = true;
			};
			lsp = {
				message = {
					enabled = true;
				};
				progress = {
					enabled = false;
					view = "mini";
				};
			};
			popupmenu = {
				enabled = true;
				backend = "nui";
			};
		};
		
		# harpoon = {
		# 	enable = true;
		# 	enableTelescope = true;
		# 	keymapsSilent = true;
		# 	keymaps = {
		# 		addFile = "<leader>ha";
		# 		toggleQuickMenu = "<C-e>";
		# 		navFile = {
		# 			"1" = "<leader>hj";
		# 			"2" = "<leader>hk";
		# 			"3" = "<leader>hl";
		# 			"4" = "<leader>hm";
		# 		};
		# 	};
		# };

		nvim-autopairs.enable = true;

		lsp = {
			enable = true;
			keymaps = {
				silent = true;
				diagnostic = {
					"<leader>k" = "goto_prev";
					"<leader>j" = "goto_next";
				};

				lspBuf = {
					"gd" = "definition";
					"gD" = "declaration";
					"gi" = "implementation";
					"gr" = "references";
					"gt" = "type_definition";
					"K" = "hover";

					"<leader>ca" = "code_action";
					"<leader>rn" = "rename";
				};
			};

			servers = {
				lua-ls = {
					enable = true;
					settings = {
						workspace.checkThirdParty = true;
						telemetry.enable = true;
					};
				};

				rust-analyzer = {
					enable = true;
					installCargo = true;
					installRustc = true;
					settings = {
						diagnostics.enable = true;
					};
				};
			};
		};

		treesitter = {
			enable = true;
			ensureInstalled = [
				"bash"
				"dockerfile"
				"gitignore"
				"go"
				"html"
				"javascript"
				"lua"
				"luadoc"
				"markdown"
				"nix"
				"proto"
				"rust"
				"toml"
				"typescript"
				"yaml"
			];
			indent = true;
			folding = true;
		};

		treesitter-context = {
			enable = true;
		};

		trouble = {
			enable = true;
		};

		telescope = {
			enable = true;
			extensions = {
				fzf-native = {
					enable = true;
				};
			};
			defaults = {
				layout_config = {
					horizontal = {
						prompt_position = "top";
					};
				};
				sorting_strategy = "ascending";
			};

			keymaps = {
				"<leader>sk" = {
					action = "keymaps, {}";
					desc = "[S]earch [K]eymaps";
				};
				"<leader>sf" = {
					action = "find_files, {}";
					desc = "[S]earch [F]iles";
				};
				"<leader>ss" = {
					action = "builtin, {}";
					desc = "[S]earch [S]elect Telecscope";
				};
				"<leader>sw" = {
					action = "grep_string, {}";
					desc = "[S]earch current [W]ord";
				};
				"<leader>sg" = {
					action = "live_grep, {}";
					desc = "[S]earch by [G]rep";
				};
			};
		};
	};
  };
}
