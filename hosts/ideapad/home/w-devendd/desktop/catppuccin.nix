{ inputs, pkgs, config, lib, ... }:
let
    flavor  = "mocha";
    accent  = "red";

    gtkSize = "compact";
    gtk-theme-name = "catppuccin-${flavor}-${accent}-${gtkSize}";
    catppuccin-gtk = pkgs.catppuccin-gtk.override {
        variant = flavor;
        accents = [ accent ];
        size = gtkSize;
    };
in {
    imports = [ inputs.catppuccin.homeModules.catppuccin ];
    catppuccin.enable = true;
    catppuccin.autoEnable = false;
    catppuccin.flavor = flavor;
    catppuccin.accent = accent;

    # catppuccin.qt5ct.enable   = true;
    catppuccin.kitty.enable   = true;
    catppuccin.obs.enable     = true;
    catppuccin.btop.enable    = true;
    catppuccin.cava.enable    = true;
    catppuccin.fcitx5.enable  = true;
    catppuccin.vesktop.enable = true;
    catppuccin.kvantum.enable = true;

    # The stubborn gtk
    gtk.theme.name = gtk-theme-name;
    gtk.theme.package = catppuccin-gtk;
    gtk.gtk3.extraConfig.gtk-application-prefer-dark-theme = 1;
    gtk.gtk4.extraConfig.gtk-application-prefer-dark-theme = 1;
}
