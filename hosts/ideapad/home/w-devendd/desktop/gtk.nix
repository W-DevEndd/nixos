{ pkgs, config, lib, ... }:

let
    iconName = "breeze-dark";
in
{
    gtk = {
        enable = true;
        iconTheme = {
            name = lib.mkForce iconName;
            package = lib.mkForce pkgs.kdePackages.breeze-icons;
        };
    };

    home.sessionVariables = {
        QS_ICON_THEME = iconName; 
    };
}

