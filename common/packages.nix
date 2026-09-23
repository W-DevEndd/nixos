{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        git
        vim

        wget
        curl

        killall
        htop
        fastfetch
        peaclock

        gcc          
        gnumake

        unzip

        brightnessctl
    ];
}
