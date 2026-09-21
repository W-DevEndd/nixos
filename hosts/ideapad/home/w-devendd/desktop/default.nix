{ pkgs, config, lib, ... }:
{
    imports = [
        ./catppuccin.nix
        ./gtk.nix
        ./hyprland.nix
        ./qt.nix
        ./cursor-theme.nix
    ];
}
