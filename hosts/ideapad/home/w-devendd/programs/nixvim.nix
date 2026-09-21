{ inputs, home-manager, pkgs, config, lib, ... }:
{
    imports = [ inputs.nixvim.homeModules.nixvim ];

    programs.nixvim = {
        version.enableNixpkgsReleaseCheck = false;
        nixpkgs.source = inputs.nixpkgs;
        nixpkgs.config.allowUnfree = true;

        enable = true;
        defaultEditor = true;

        # -----
        # Core
        # -----

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

        # -----
        # Theme
        # -----

        colorschemes.catppuccin = {
            enable = true;

            settings.flavour = "mocha";
        };
       
        # -----
        # Plugins
        # -----

        # Depend
        plugins.web-devicons.enable = true;

        # UI
        plugins.lualine.enable = true;
        plugins.telescope.enable = true;
        plugins.barbar.enable = true;

        plugins.neo-tree.enable = true;
        plugins.neo-tree.settings.filesystem = {
            useLibuvFileWatcher = true;
            follow_current_file = {
                enabled = true;
                leave_dirs_open = true;
            };
        };

        # Coding
        plugins.treesitter.enable = true;
        plugins.treesitter.nixGrammars = false; 
        plugins.treesitter.settings = {
            auto_install = true; 
            ensure_installed = [ ]; 
            highlight.enable = true;
        };

        plugins.blink-cmp.enable = true;
        plugins.blink-cmp.settings.keymap = {
            "<C-b>" = [
                "scroll_documentation_up"
                    "fallback"
            ];
            "<C-e>" = [
                "hide"
            ];
            "<C-f>" = [
                "scroll_documentation_down"
                    "fallback"
            ];
            "<C-n>" = [
                "select_next"
                    "fallback"
            ];
            "<C-p>" = [
                "select_prev"
                    "fallback"
            ];
            "<C-space>" = [
                "show"
                    "show_documentation"
                    "hide_documentation"
            ];
            "<C-y>" = [
                "select_and_accept"
            ];
            "<Down>" = [
                "select_next"
                    "fallback"
            ];
            "<S-Tab>" = [
                "snippet_backward"
                    "fallback"
            ];
            "<Tab>" = [
                "snippet_forward"
                    "fallback"
            ];
            "<Up>" = [
                "select_prev"
                    "fallback"
            ];
        };
        plugins.blink-cmp.settings.completion.menu.border = "rounded";
        plugins.blink-cmp.settings.signature.window.border = "rounded";
        plugins.blink-cmp.settings.completion.documentation.window.border = "rounded";

        # -----
        # LSP
        # -----

        lsp.servers.nixd.enable = true;
        lsp.servers.nixd.config = {
            settings = {
                nixd = {
                    options = {
                        nixos = {
                            expr = "(builtins.getFlake (builtins.toString ./.)).nixosConfigurations.hostname.options";
                        };
                    };
                };
            };
        };
        lsp.servers.pyright.enable = true;
        lsp.servers.ccls.enable = true;
    };

    home.packages = with pkgs; [
        nixd pyright ccls
    ];
}
