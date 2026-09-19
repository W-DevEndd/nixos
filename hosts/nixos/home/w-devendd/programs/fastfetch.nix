{ pkgs, config, lib, ... }:
{
    home.packages = with pkgs; [ fastfetch ];
    xdg.configFile."fastfetch".source = config.lib.file.mkOutOfStoreSymlink "${config."w-devendd".dotfilesRoot}/fastfetch";
}
