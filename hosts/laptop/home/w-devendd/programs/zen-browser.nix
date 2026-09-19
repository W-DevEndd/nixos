{ inputs, pkgs, config, lib, ... }:
{
    imports = [ inputs.zen-browser.homeModules.beta ];

        programs.zen-browser = {
            enable = true;
            setAsDefaultBrowser = true;
        };
}
