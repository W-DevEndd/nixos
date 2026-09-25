{ pkgs, config, lib, ... }:
{
    imports = [
        ./zen-browser.nix
        ./vesktop.nix
        ./vscode.nix
    ];

    home.packages = with pkgs; [
        # Socal
        telegram-desktop ytmdesktop

        # Office
        onlyoffice-desktopeditors

        # Media
        obs-studio
        vlc
        upscaler losslesscut-bin

        # Archive
        kdePackages.ark

        # Share and Fetch
        motrix-next

        # Launcher
        gearlever
    ];
}
