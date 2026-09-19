{ pkgs, config, lib, ... }:
{
    qt.enable = true;
    qt.platformTheme = "qtct";
    qt.kvantum.enable = true;

    home.packages = with pkgs; [ kdePackages.qt6ct kdePackages.qtdeclarative ];
}
