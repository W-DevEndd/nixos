{ pkgs, config, lib, ... }:
{
    programs.lutris = {
        enable = true;
        defaultWinePackage = pkgs.proton-ge-bin;
        extraPackages = with pkgs; [mangohud winetricks gamescope gamemode umu-launcher];
        protonPackages = [ pkgs.proton-ge-bin ];
    };
}
