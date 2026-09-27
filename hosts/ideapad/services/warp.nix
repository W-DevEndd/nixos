{ pkgs, config, lib, ... }:
{
    services.cloudflare-warp = {
        enable = true;
        openFirewall = true;
    };
}
