{ config, pkgs, home-manager, ... }:
{
    users.users = {
        "w-devendd" = {
            isNormalUser = true;
            extraGroups = [ "wheel" "networkmanager" "docker" ];
        };
    };

    home-manager = {
        users = {
            "w-devendd" = import ./home/w-devendd;
        };
    };
}
