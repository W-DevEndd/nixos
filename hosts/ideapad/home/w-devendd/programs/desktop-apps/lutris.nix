{ pkgs, config, lib, ... }: let
    gdk-proton = pkgs.stdenv.mkDerivation (finalAttrs: {
        pname = "gdk-proton";
        version = "10-32";
        src = pkgs.fetchzip {
            url = "https://github.com/Weather-OS/GDK-Proton/releases/download/release10-32/GDK-Proton10-32.tar.gz";
            hash = "sha256-x6LuikI5/hdl6+Y0llTYLDJbX+flma1wJSrJYHxyYQ0=";
            stripRoot = true;
        };

        dontConfigure = true;
        dontBuild = true;

        installPhase = ''
            mkdir -p $out
            cp -r * $out/

            cp -f ${pkgs.proton-ge-bin.steamcompattool}/files/lib/wine/x86_64-windows/combase.dll \
                $out/files/lib/wine/x86_64-windows/
            cp -f ${pkgs.proton-ge-bin.steamcompattool}/files/lib/wine/i386-windows/combase.dll \
                $out/files/lib/wine/i386-windows/
        '';
        passthru.steamcompattool = finalAttrs.finalPackage;
    });
in {
    programs.lutris = {
        enable = true;
        defaultWinePackage = pkgs.proton-ge-bin;
        extraPackages = with pkgs; [mangohud winetricks gamescope gamemode umu-launcher];
        protonPackages = [ pkgs.proton-ge-bin gdk-proton ];
    };
}
