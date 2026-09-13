{ config, lib, pkgs, ... }:
{
    programs.kitty.enable = true;
    programs.kitty.font.name = "JetBrainsMono Nerd Font";
    programs.kitty.font.package = pkgs.jetbrains-mono;
}
