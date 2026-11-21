{ pkgs, config, lib, ... }:
{
    nixpkgs.config = {
        allowUnfree = true;
    };
    nix.settings.trusted-substituters = [
        "https://cache.nixos.org"
        "https://hydra.nixos.org/"
        "https://mirrors.tuna.tsinghua.edu.cn/"

        # AAGL
        "https://ezkea.cachix.org"
    ];
    nix.settings.trusted-public-keys = [
        # AAGL
        "ezkea.cachix.org-1:ioBmUbJTZIKsHmWWXPe1FSFbeVe+afhfgqgTSNd34eI="
    ];
    programs.nix-ld.enable = true;
}
