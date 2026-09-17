{ pkgs, config, lib, ... }:
{
    programs.quickshell.enable = true;
    xdg.configFile."quickshell".source = config.lib.file.mkOutOfStoreSymlink "${config."w-devendd".dotfilesRoot}/quickshell";
}
