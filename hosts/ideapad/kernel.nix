{ pkgs, config, lib, ... }:
{
    nix.settings.substituters = [
        "https://attic.xuyh0120.win/lantian"
        "https://cache.xinux.uz"
    ];
    nix.settings.trusted-public-keys = [
        "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
        "cache.xinux.uz:BXCrtqejFjWzWEB9YuGB7X2MV4ttBur1N8BkwQRdH+0="
    ];
    boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest;
}
