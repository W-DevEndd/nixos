{ pkgs, config, lib, ... }:
{
    nix.settings.substituters = [
        "https://cache.xinux.uz"
    ];
    nix.settings.trusted-public-keys = [
        "cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0="
    ];
    boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
}
