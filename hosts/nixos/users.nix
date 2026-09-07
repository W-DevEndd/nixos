{ config, pkgs, home-manager, ... }:
{
    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        users = {
            "w-devendd" = import ./home/w-devendd/user.nix;
        };
        backupFileExtension = "bak";
    };

    users.users = {
        "w-devendd" = {
            isNormalUser = true;
            extraGroups = [
                "wheel" "networkmanager"
            ];
        };
    };
}
