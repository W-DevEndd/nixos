{ inputs, home-manager, pkgs, config, lib, ... }:
{
    imports = [ inputs.nixvim.homeModules.nixvim ];

    programs.nixvim = {
        version.enableNixpkgsReleaseCheck = false;
        nixpkgs.source = inputs.nixpkgs;
        nixpkgs.config.allowUnfree = true;

        enable = true;
        defaultEditor = true;

        # Core
        opts = {
            number = true;
            relativenumber = true;
            wrap = false;

            tabstop = 4;
            shiftwidth = 4;

            scrolloff = 8;
            sidescrolloff = 5;

            expandtab = true;
            smartindent = true;

            cursorline = true;
        };

        # Theme
        colorschemes.catppuccin = {
            enable = true;

            settings.flavour = "mocha";
        };

        # Plugins
        plugins.web-devicons.enable = true;

        plugins.lualine.enable = true;
        plugins.barbar.enable = true;
        plugins.neo-tree = {
            enable = true;
            settings.filesystem = {
                useLibuvFileWatcher = true;
                follow_current_file = {
                    enabled = true;
                    leave_dirs_open = true;
                };
            };
        };

        plugins.telescope.enable = true;
        plugins.blink-cmp.enable = true;
        plugins.blink-cmp.settings = {
            appearance = {
                nerd_font_variant = "normal";
                use_nvim_cmp_as_default = true;
            };
            completion = {
                accept = {
                    auto_brackets = {
                        enabled = true;
                        semantic_token_resolution = {
                            enabled = false;
                        };
                    };
                };
                documentation = {
                    auto_show = true;
                };
            };
            keymap = {
                preset = "super-tab";
            };
            signature = {
                enabled = true;
            };
            sources = {
                cmdline = [ ];
                providers = {
                    buffer = {
                        score_offset = -7;
                    };
                    lsp = {
                        fallbacks = [ ];
                    };
                };
            };
        };


        # LSP
        lsp.servers.nixd.enable = true;
        lsp.servers.pyright.enable = true;
        lsp.servers.ccls.enable = true;
    };

    home.packages = with pkgs; [
        nixd pyright ccls
    ];
}
