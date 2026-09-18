{ pkgs, config, lib, ... }:
{
    qt = {
        enable = true;
        platformTheme = "qt5ct";
    };

    environment.systemPackages = [ pkgs.kdePackages.qt6ct ];
}
