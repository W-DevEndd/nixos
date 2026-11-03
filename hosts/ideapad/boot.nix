{ config, pkgs, ... }:
{
    boot = {
        supportedFilesystems.fuse = true;
        loader = {
            systemd-boot.enable = false;
            efi.canTouchEfiVariables = false;

            grub.enable = true;
            grub.device = "nodev";
        };
    };
}
