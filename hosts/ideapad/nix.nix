{ pkgs, config, lib, ... }:
{
    nixpkgs.config = {
        allowUnfree = true;
    };
    nix.settings.trusted-substituters = [
        "https://cache.nixos.org"
        "https://hydra.nixos.org/"
        "https://mirrors.tuna.tsinghua.edu.cn/"
    ];
}
