{ pkgs, lib, config, ... }:
{
    hardware.graphics.enable = true;

    zramSwap = {
        enable = true;
        memoryPercent = 100;
        algorithm = "zstd";
    };
}
