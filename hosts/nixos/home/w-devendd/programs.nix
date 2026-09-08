{ config, ... }:
{
    imports = [
        ./programs/git.nix
        ./programs/neovim.nix
    ];
}
