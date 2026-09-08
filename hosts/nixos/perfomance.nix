{ pkgs, lib, config, ... }:
{
    hardware.graphics = {
        enable = true;
        enable32Bit = true;
        # extraPackage = with pkgs; [
        # ];
    };

    zramSwap = {
        enable = true;
        memoryPercent = 100;
        algorithm = "zstd";
    };
}
