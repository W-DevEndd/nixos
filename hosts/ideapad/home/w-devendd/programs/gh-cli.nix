{ pkgs, config, lib, ... }:
{
    programs.gh.enable = true;
    programs.gh.settings.editor = "vim";
}
