{ pkgs, config, lib, ... }:
{
    imports = [
        ./env.nix
        ./packages.nix
        ./services
        ./networking.nix
        ./locale.nix
        ./perfomance.nix
        ./nix.nix
    ];
}
