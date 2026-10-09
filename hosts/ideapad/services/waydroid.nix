{ pkgs, config, lib, ... }:
{
    virtualisation.waydroid.enable = true;
    environment.systemPackages = with pkgs; [
        lzip
        waydroid-script
    ];
}
