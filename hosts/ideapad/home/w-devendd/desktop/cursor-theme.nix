{ pkgs, config, lib, ... }:
let
    cursorName = "Elaina-Cursor";
in
{
    home.file.".icons/${cursorName}".source = lib.mkForce (
        config.lib.file.mkOutOfStoreSymlink "${config."w-devendd".dotfilesRoot}/_Elaina-Cursor"
    );
    home.pointerCursor.name = "${cursorName}";
    home.pointerCursor.package = pkgs.emptyDirectory;
    home.pointerCursor.enable = true;
    home.pointerCursor.gtk.enable = true;
}
