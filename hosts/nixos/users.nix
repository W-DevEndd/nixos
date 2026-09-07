{ config, pkgs, ... }:
{
    users.users = {
        "w-devendd" = {
            imports = [ ./home/w-devendd.nix ];
            isNormalUser = true;
            extraGroups = [
                "wheel" "networkmanager"
            ];
        };
    };
}
