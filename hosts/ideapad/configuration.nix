# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
{
    imports = [
        ../../common
        ./boot.nix
        ./kernel.nix
        ./hardware.nix
        ./perfomance.nix
        ./users.nix
        ./locale.nix
        ./services
        ./nix.nix
        ./fonts.nix
    ];

    system.stateVersion = "26.05";
}
