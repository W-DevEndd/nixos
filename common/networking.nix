
{ config, pkgs, ... }:
{
    networking = {
        hostName = "nixos";
        networkmanager.enable = true;
        nameservers = [ "1.1.1.1" "8.8.8.8" ];
    };
}
