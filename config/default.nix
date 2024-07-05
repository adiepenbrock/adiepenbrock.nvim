{pkgs, ...}: {
  config = {
    globals.mapleader = " ";
    globals.maplocalleader = " ";

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

      foldcolumn = "0";
      foldlevel = 99;
      foldlevelstart = 99;
      foldenable = true;

      encoding = "utf-8";
      fileencoding = "utf-8";
    };

    colorschemes = {
      catppuccin = {
        enable = true;
        settings = {
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
    };

    keymaps = [
      {
        mode = "n";
        key = "<Esc>";
        action = "<cmd>nohlsearch<CR>";
      }
      {
        mode = "n";
        key = "<C-x>";
        action = "<cmd>Ex<CR>";
        options.desc = "E[x]it the currently open buffer";
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
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
        options.desc = "Use move command when line is highlighted";
      }
      {
        mode = "v";
        key = "K";
        action = ":m '>-2<CR>gv=gv";
        options.desc = "Use move command when line is highlighted";
      }
      {
        mode = "n";
        key = "k";
        action = "v:count == 0 ? 'gkzz' : 'kzz'";
        options = {
          expr = true;
          silent = true;
        };
      }
      {
        mode = "n";
        key = "j";
        action = "v:count == 0 ? 'gjzz' : 'jzz'";
        options = {
          expr = true;
          silent = true;
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
      {
        mode = "n";
        key = "<leader>un";
        action = ''<cmd>lua require("notify").dismiss({ silent = true, pending = true })<CR>'';
        options = {
          desc = "Dismiss All Notifications";
        };
      }
      {
        mode = ["n" "v"];
        key = "<leader>cf";
        action = "<cmd>lua vim.lsp.buf.format()<CR>";
        options = {
          silent = true;
          desc = "[C]ode [F]ormat";
        };
      }
      {
        mode = "n";
        key = "<leader>tt";
        action = ":FloatermNew --autoclose=2 --height=0.9 --width=0.9 zsh<CR>";
        options = {
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<leader>lg";
        action = ":FloatermNew --autoclose=2 --height=0.9 --width=0.9 lazygit<CR>";
        options = {
          silent = true;
        };
      }

      # telescope specific stuff
      {
        mode = "n";
        key = "<leader>sk";
        action = "<cmd>Telescope keymaps<CR>";
        options = {
          silent = true;
          desc = "[S]earch [K]eymaps";
        };
      }
      {
        mode = "n";
        key = "<leader>sf";
        action = "<cmd>Telescope find_files<CR>";
        options = {
          silent = true;
          desc = "[S]earch [F]iles";
        };
      }
      {
        mode = "n";
        key = "<leader>ss";
        action = "<cmd>Telescope builtin<CR>";
        options = {
          silent = true;
          desc = "[S]earch [S]elect Telecscope";
        };
      }
      {
        mode = "n";
        key = "<leader>sw";
        action = "<cmd>Telescope grep_string<CR>";
        options = {
          silent = true;
          desc = "[S]earch current [W]ord";
        };
      }
      {
        mode = "n";
        key = "<leader>sg";
        action = "<cmd>Telescope live_grep<CR>";
        options = {
          silent = true;
          desc = "[S]earch by [G]rep";
        };
      }

      # copilot keymaps
      {
        mode = "n";
        key = "<leader>ap";
        action = "<cmd>Copilot panel<CR>";
        options = {
          silent = true;
          desc = "[A]i [P]anel";
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
            add = {text = "+";};
            change = {text = "~";};
            topdelete = {text = "‾";};
            changedelete = {text = "~";};
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

      notify = {
        enable = true;
        fps = 60;
        render = "default";
        timeout = 1000;
        topDown = true;
      };

      nvim-autopairs.enable = true;

      lsp-format = {enable = true;};
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

          gopls = {
            enable = true;
          };

          tsserver = {
            enable = true;
          };

          terraformls = {
            enable = true;
          };

          texlab = {
            enable = true;
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

      none-ls = {
        enable = true;
        enableLspFormat = true;
        settings = {
          update_in_insert = true;
        };
        sources = {
          code_actions = {
            gitsigns.enable = true;
          };
          formatting = {
            alejandra = {enable = true;};
            prettier = {
              enable = true;
              disableTsServerFormatter = true;
              withArgs = ''
                {
                    extra_args = { "--no-semi", "--single-quote" },
                }
              '';
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
          "latex"
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
        settings = {
          defaults = {
            layout_config = {
              horizontal = {
                prompt_position = "top";
              };
            };
            sorting_strategy = "ascending";
          };
        };
      };

      luasnip = {
        enable = true;
        extraConfig = {
          enable_autosnippets = true;
          store_selection_keys = "<Tab>";
        };
      };

      cmp = {
        enable = true;
        settings = {
          autoEnableSources = true;
          experimental = {
            ghost_text = true;
          };
          performance = {
            debounce = 60;
            fetchingTimeout = 200;
            maxViewEntries = 30;
          };
          snippet = {
            expand = "function(args) require('luasnip').lsp_expand(args.body) end";
          };
          formatting = {fields = ["kind" "abbr" "menu"];};
          completion = {
            completeopt = "menu,menuone,noinsert";
          };
          sources = [
            {name = "nvim_lsp";}
            {
              name = "buffer";
              option.get_nufnrs.__raw = "vim.api.nvim_list_bufs";
              keywordLength = 3;
            }
            {
              name = "luasnip";
              keywordLength = 3;
            }
          ];

          window = {
            completion = {
              border = "rounded";
              winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:Visual,Search:None";
            };
            documentation = {border = "rounded";};
          };

          mapping = {
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<C-j>" = "cmp.mapping.select_next_item()";
            "<C-k>" = "cmp.mapping.select_prev_item()";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
            "<S-CR>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
          };
        };
      };

      cmp-nvim-lsp = {enable = true;};
      cmp-buffer = {enable = true;};
      cmp_luasnip = {enable = true;};

      # copilot-cmp = {
      #   enable = true;
      # };
      #
      # copilot-lua = {
      #   enable = true;
      #   suggestion = {enabled = false;};
      #   panel = {enabled = false;};
      # };

      copilot-vim = {
        enable = true;
      };

      floaterm = {
        enable = true;
      };
    };

    extraConfigLua = ''
        vim.api.nvim_create_autocmd('TextYankPost', {
            desc = "Highlight when yanking (copying) text",
            group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
            callback = function()
                vim.highlight.on_yank()
            end,
        })

        require("telescope").setup{
            pickers = {
                colorscheme = {
                    enable_preview = true
                }
            }
        }

        luasnip = require("luasnip")
        kind_icons = {
          Text = "󰊄",
          Method = "",
          Function = "󰡱",
          Constructor = "",
          Field = "",
          Variable = "󱀍",
          Class = "",
          Interface = "",
          Module = "󰕳",
          Property = "",
          Unit = "",
          Value = "",
          Enum = "",
          Keyword = "",
          Snippet = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
          Struct = "",
          Event = "",
          Operator = "",
          TypeParameter = "",
        }

      local cmp = require'cmp'

        -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({'/', "?" }, {
            sources = {
            { name = 'buffer' }
            }
            })

      -- Set configuration for specific filetype.
        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
                }, {
                { name = 'buffer' },
                })
            })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline(':', {
            sources = cmp.config.sources({
                { name = 'path' }
                }, {
                { name = 'cmdline' }
                }),
            })
    '';
  };
}
