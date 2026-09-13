{ config, ... }:
{
    imports = [
        ./git.nix
        ./nixvim.nix
        ./kitty.nix
    ];
}
