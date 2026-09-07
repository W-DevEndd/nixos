{ config, pkgs, home-manager, ... }:
{
    users.users = {
        "w-devendd" = {
            isNormalUser = true;
            extraGroups = [
                "wheel" "networkmanager"
            ];
        };
    };

    home-manager = {
        users = {
            "w-devendd" = import ./home/w-devendd/_user.nix;
        };
    };
}
