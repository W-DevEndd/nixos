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
        vlc qimgv
        upscaler losslesscut-bin
        liner

        # Archive
        kdePackages.ark

        # Getter
        video-downloader
    ];
}
