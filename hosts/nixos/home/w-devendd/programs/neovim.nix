{ home-manager, config, pkgs, ... }:
{
    programs.neovim = {
        enable = true;
    };
    home.packages = with pkgs; [
        nixd
        lua-language-server
        pyright
    ];
}
