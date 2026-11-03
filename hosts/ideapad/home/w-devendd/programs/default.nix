{ pkgs, config, ... }:
{
    imports = [
        ./desktop-apps
        ./bash.nix
        ./git.nix
        ./btop.nix
        ./fastfetch.nix

        # ./nixvim.nix
        ./neovim.nix
        ./gh-cli.nix
    ];

    home.packages = with pkgs; [
        cava tree
        appimage-run
    ];
}
