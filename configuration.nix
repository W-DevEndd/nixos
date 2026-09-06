# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
{
    imports = [
        ./hardware-configuration.nix
    ];



    boot.loader = {
        systemd-boot.enable = false;
        efi.canTouchEfiVariables = false;

        grub.enable = true;
        grub.device = "nodev";
    };



    networking = {
        hostName = "nixos";
        networkmanager.enable = true;
    };



    time = {
        timeZone = "Asia/Ho_Chi_Minh";
        hardwareClockInLocalTime = true;
    };



    users.users."w-devendd" = {
        isNormalUser = true;
        extraGroups = [
            "wheel" "networkmanager"
        ];
    };
}
