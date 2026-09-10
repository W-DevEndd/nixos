{ config, ... }:
{
    imports = [
        ./programs/git.nix
        ./programs/nixvim.nix
    ];
}
