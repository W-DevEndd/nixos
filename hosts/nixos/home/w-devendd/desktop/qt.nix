{ pkgs, config, lib, ... }:
{
    qt.kvantum.enable = true;

    home.packages = with pkgs; [ kdePackages.qt6ct kdePackages.qtdeclarative ];
}
