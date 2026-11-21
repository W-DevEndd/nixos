{ inputs, pkgs, config, lib, ... }:
{
    home.packages = [
        inputs.twintaillauncher.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
    programs.mangohud.enable = true;
}
