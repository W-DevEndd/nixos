{ pkgs, config, lib, ... }:
{
    qt.enable = true;
    qt.platformTheme.name = "kvantum";
    qt.style.name = "kvantum";

    home.packages = with pkgs; [ kdePackages.qt6ct kdePackages.qtdeclarative ];
}
