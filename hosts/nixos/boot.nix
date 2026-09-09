{ config, pkgs, ... }:
{
    boot.plymouth.enable = false;
    boot.loader = {
        systemd-boot.enable = false;
        efi.canTouchEfiVariables = false;

        grub.enable = true;
        grub.device = "nodev";
    };
}
