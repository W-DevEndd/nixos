{ pkgs, config, lib, ... }:
{
    imports = [
        ./packages.nix
        ./service
        ./networking.nix
        ./locale.nix
        ./perfomance.nix
    ];
}
