{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        file
        gnumake
        gcc

        vim
        git
        wget
        curl

        htop
        fastfetch
        peaclock
        ncdu
        tree

        unzip
        brightnessctl
    ];
}
