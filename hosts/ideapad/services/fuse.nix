{ pkgs, config, lib, ... }:
{
    programs.fuse.enable = true;
    programs.fuse.userAllowOther = true;
}
