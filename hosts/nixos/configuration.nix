# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
{
    i18n.defaultLocale = "en_US.UTF-8";
    time = {
        timeZone = "Asia/Ho_Chi_Minh";
        hardwareClockInLocalTime = true;
    };

    imports = [
        ../../common/pkgs.nix
        ./hardware.nix
        ./boot.nix
        ./networking.nix
        ./users.nix
    ];

    system.stateVersion = "26.05";
}
