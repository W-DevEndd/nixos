{ pkgs, lib, config, ... }:
{
    environment.pathsToLink = [ 
        "/share/applications" 
        "/share/xdg-desktop-portal" 
    ];
}
