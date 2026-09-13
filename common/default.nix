{ pkgs, config, lib, ... }:
{
    imports = [
        ./packages.nix
        ./services
        ./networking.nix
        ./locale.nix
        ./perfomance.nix
        ./nix.nix
    ];
}
