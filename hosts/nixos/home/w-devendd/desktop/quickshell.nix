{ inputs, pkgs, config, lib, ... }:
{
    programs.quickshell = {
        enable = true;
        package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };
    home.packages = [
        pkgs.qt6.qtmultimedia
    ];
    xdg.configFile."quickshell".source = config.lib.file.mkOutOfStoreSymlink "${config."w-devendd".dotfilesRoot}/quickshell";
}
