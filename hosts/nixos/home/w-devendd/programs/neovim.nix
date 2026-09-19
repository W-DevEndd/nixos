{ pkgs, config, lib, ... }:
{
    home.packages = with pkgs; [
        neovim
        ripgrep fd fzf
        nixd lua-language-server ccls
    ];
    xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${config."w-devendd".dotfilesRoot}/nvim";
}
