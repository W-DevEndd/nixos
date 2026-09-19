{ pkgs, config, lib, ... }:
{
    gtk = {
        enable = true;
        iconTheme = {
            name = lib.mkForce "breeze-dark";
            package = lib.mkForce pkgs.kdePackages.breeze-icons;
        };
    };
}
