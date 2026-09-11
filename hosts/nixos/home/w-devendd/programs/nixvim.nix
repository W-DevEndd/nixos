{ inputs, home-manager, config, lib, ... }:
{
    imports = [ inputs.nixvim.homeModules.nixvim ];

    programs.nixvim = {
        version.enableNixpkgsReleaseCheck = false;
        nixpkgs.source = inputs.nixpkgs;

        enable = true;
        defaultEditor = true;

        colorschemes.catppuccin.enable = true;
        plugins.lualine.enable = true;
    };
}
