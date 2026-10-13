{ pkgs, lib, config, ... }:
{
    nix.settings = {
        substituters = ["https://hyprland.cachix.org"];
        trusted-substituters = ["https://hyprland.cachix.org"];
        trusted-public-keys = ["hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
        trusted-users = ["root" "@wheel"];
    };

    programs.hyprland = {
        enable = true;
        xwayland.enable = true;
    };
    environment.etc."hypr/plugins/libhypr-dynamic-cursors.so".source = "${pkgs.hyprlandPlugins.hypr-dynamic-cursors}/lib/libhypr-dynamic-cursors.so";
}
