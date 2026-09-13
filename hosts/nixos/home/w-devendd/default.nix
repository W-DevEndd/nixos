
{ config, pkgs, lib, ... }:
{
    home.username = "w-devendd";
    home.stateVersion = "26.05";
    # home.homeDirectory = "/home/w-devendd/";

    imports = [
        ./programs
        ./desktop
    ];
}
