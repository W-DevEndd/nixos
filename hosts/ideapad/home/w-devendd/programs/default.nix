{ pkgs, config, ... }:
{
    imports = [
        ./desktop-apps
        ./bash.nix
        ./git.nix
        ./btop.nix
        # ./nixvim.nix
        ./neovim.nix
        ./kitty.nix
        ./gh-cli.nix
        ./fastfetch.nix
    ];

    home.packages = with pkgs; [
        cava tree
    ];
}
