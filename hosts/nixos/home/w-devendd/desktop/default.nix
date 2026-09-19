{ pkgs, config, lib, ... }:
{
    imports = [
        ./catppuccin.nix
        ./icons.nix
        ./hyprland.nix
        ./qt.nix
    ];
}
