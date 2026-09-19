{ pkgs, config, ... }:
{
    imports = [
        ./git.nix
        # ./nixvim.nix
        ./neovim.nix
        ./kitty.nix
        ./zen-browser.nix
        ./gh-cli.nix
        ./fastfetch.nix
    ];

    home.packages = with pkgs; [
        cava btop
        vesktop obs-studio
    ];
}
