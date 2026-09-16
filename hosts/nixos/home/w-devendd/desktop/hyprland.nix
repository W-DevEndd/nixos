{ config, pkgs, lib, ... }:
{
    xdg.configFile."hypr".source = config.lib.file.mkOutOfStoreSymlink "${config."w-devendd".dotfilesRoot}/hypr";

    imports = [
        ../programs/kitty.nix
    ];
}
