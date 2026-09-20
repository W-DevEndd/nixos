{ pkgs, lib, config, ... }:
{
    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };
    environment.etc."hypr/plugins/libhypr-dynamic-cursors.so".source = "${pkgs.hyprlandPlugins.hypr-dynamic-cursors}/lib/libhypr-dynamic-cursors.so";
}
