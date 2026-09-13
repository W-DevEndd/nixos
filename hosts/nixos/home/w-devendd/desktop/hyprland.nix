{ config, pkgs, lib, ... }:
{
    wayland.windowManager.hyprland.enable = true;
    wayland.windowManager.hyprland.xwayland.enable = true;

    wayland.windowManager.hyprland.extraConfig = builtins.readFile ./hyprland.lua;

    imports = [
        ../programs/kitty.nix
    ];
}
