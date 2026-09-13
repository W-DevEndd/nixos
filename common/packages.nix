{ pkgs, ... }:
{
    environment.systemPackages = with pkgs; [
        git
        vim

        wget
        curl

        htop
        fastfetch

        ripgrep      
        fd           
        fzf

        gcc          
        gnumake

        unzip
    ];
}
