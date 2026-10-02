{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        git
        vim

        wget
        curl

        htop
        fastfetch
        peaclock
        ncdu
        tree

        gcc          
        gnumake

        unzip

        brightnessctl
    ];
}
