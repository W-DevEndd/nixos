{ pkgs, config, lib, ... }:
{
    imports = [
        ./zen-browser.nix
        ./vesktop.nix
        ./vscode.nix
        ./obs-studio.nix
    ];

    home.packages = with pkgs; [
        # Social
        telegram-desktop
        zalo

        # Media
        liner
        vlc qimgv

        # Office && Studio
        onlyoffice-desktopeditors
        upscaler losslesscut-bin

        # Archive
        kdePackages.ark

        # Getter
        video-downloader
    ];
}
