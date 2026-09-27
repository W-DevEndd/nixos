{ inputs, pkgs, config, lib, ... }:
{
    programs.quickshell = {
        enable = true;
        package = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };
    home.packages = with pkgs; [
        qt6.qtmultimedia qt6.qtimageformats qt6.qtsvg
        ffmpeg imagemagick
    ];
    xdg.configFile."quickshell".source = config.lib.file.mkOutOfStoreSymlink "${config."w-devendd".dotfilesRoot}/quickshell";
}
