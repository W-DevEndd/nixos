{ pkgs, config, lib, ... }:
{
    imports = [
        ./hyprland.nix
        ./programs/kitty.nix
    ];
}
