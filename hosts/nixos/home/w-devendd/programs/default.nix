{ pkgs, config, ... }:
{
    imports = [
        ./bash.nix
        ./git.nix
        # ./nixvim.nix
        ./neovim.nix
        ./kitty.nix
        ./zen-browser.nix
        ./gh-cli.nix
        ./fastfetch.nix
    ];

    home.packages = with pkgs; [
        cava btop tree
        vesktop obs-studio
    ];
}
