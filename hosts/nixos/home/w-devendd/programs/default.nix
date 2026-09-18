{ config, ... }:
{
    imports = [
        ./git.nix
        ./nixvim.nix
        ./kitty.nix
        ./zen-browser.nix
    ];
}
