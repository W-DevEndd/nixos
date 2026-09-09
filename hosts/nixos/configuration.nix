# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, ... }:
{
    nixpkgs.config = {
        allowUnfree = true;
    };
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    imports = [
        ../../common/packages.nix
        ./boot.nix
        ./hardware.nix
        ./networking.nix
        ./perfomance.nix
        ./users.nix
        ./locale.nix
    ];

    system.stateVersion = "26.05";
}
