{ config, pkgs, lib, ... }:
{
    xdg.configFile."hypr".source = config.lib.file.mkOutOfStoreSymlink "${config."w-devendd".dotfilesRoot}/hypr";

    home.packages = with pkgs; [kdePackages.dolphin grim satty];

    imports = [
        ../programs/kitty.nix
        ./quickshell.nix
    ];
}
