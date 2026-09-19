{ pkgs, config, lib, ... }:
{
    qt = {
        enable = true;
        platformTheme = "qt5ct";
    };

    environment.systemPackages = with pkgs; [ kdePackages.qt6ct kdePackages.qtdeclarative ];
}
