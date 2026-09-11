{ inputs, home-manager, config, lib, ... }:
{
    imports = [ inputs.nixvim.homeModules.nixvim ];

    programs.nixvim = {
        version.enableNixpkgsReleaseCheck = false;
        nixpkgs.source = inputs.nixpkgs;

        enable = true;
        defaultEditor = true;

        # Theme
        colorschemes.catppuccin = {
            enable = true;

            settings.flavour = "mocha";
        };

        # Plugins
        plugins.lualine = {
            enable = true;
        };
    };
}
