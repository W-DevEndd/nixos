{ pkgs, config, lib, ... }:
{
    home.packages = with pkgs; [ neovim ];
    xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config."w-devendd".dotfilesRoot}/nvim";
}
