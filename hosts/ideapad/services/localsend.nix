{ pkgs, config, lib, ... }:
{
    programs.localsend.enable = true;
    programs.localsend.openFirewall = true;
}
