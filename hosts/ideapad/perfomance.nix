{ pkgs, lib, config, ... }:
{

    hardware.cpu.amd.updateMicrocode = true;

    hardware.graphics = {
        enable = true;
        enable32Bit = true;
        extraPackages = with pkgs; [ mesa ];
    };
}
