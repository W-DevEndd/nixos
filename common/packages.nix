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

        gcc          
        gnumake

        unzip

        brightnessctl
    ];
}
