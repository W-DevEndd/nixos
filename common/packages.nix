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

        ripgrep      
        fd           
        fzf

        gcc          
        gnumake

        unzip

        brightnessctl
    ];
}
