{ config, pkgs, lib, ... }:
{
    xdg.configFile."hypr".source = config.lib.file.mkOutOfStoreSymlink "${config."w-devendd".dotfilesRoot}/hypr";

    home.packages = with pkgs; [
        # File Managers
        kdePackages.dolphin kdePackages.kfind
        kdePackages.kde-cli-tools

        # Screenshot
        grim satty
    ];

    imports = [
        ../programs/kitty.nix
        ./quickshell.nix
    ];
}
