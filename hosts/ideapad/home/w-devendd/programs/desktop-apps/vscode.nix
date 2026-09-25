{ pkgs, config, lib, ... }:
{
    programs.vscode.enable = true;
    programs.vscode.package = pkgs.vscode-fhs;
    programs.vscode.mutableExtensionsDir = true;
}
