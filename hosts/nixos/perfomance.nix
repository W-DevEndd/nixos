{ pkgs, lib, config, ... }:
{

    hardware.cpu.amd.updateMicrocode = true;

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
