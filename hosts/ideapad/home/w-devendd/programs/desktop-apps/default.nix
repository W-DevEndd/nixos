{ pkgs, config, lib, ... }:
{
    imports = [
        ./zen-browser.nix
        ./vesktop.nix
        ./vscode.nix
        ./obs-studio.nix
    ];

    home.packages = with pkgs; [
        # Socal
        telegram-desktop

        # Office
        onlyoffice-desktopeditors

        # Media
        vlc
        upscaler losslesscut-bin

        # Archive
        kdePackages.ark

        # Getter
        video-downloader
    ];
}
