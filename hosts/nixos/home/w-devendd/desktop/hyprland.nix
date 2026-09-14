{ config, pkgs, lib, ... }:
{
    wayland.windowManager.hyprland.enable = true;
    wayland.windowManager.hyprland.xwayland.enable = true;

    imports = [
        ../programs/kitty.nix
    ];
}
