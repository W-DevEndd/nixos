{ inputs, pkgs, config, lib, ... }:
{
    imports = [ inputs.catppuccin.homeModules.catppuccin ];
    catppuccin.enable = true;
    catppuccin.autoEnable = false;
    catppuccin.accent = "red";
    catppuccin.flavor = "mocha";

    catppuccin.qt5ct.enable  = true;
    catppuccin.kitty.enable  = true;
    catppuccin.obs.enable    = true;
    catppuccin.btop.enable   = true;
    catppuccin.cava.enable   = true;
    catppuccin.fcitx5.enable = true;
}
