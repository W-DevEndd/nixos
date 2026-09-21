{ home-manager, config, ... }:
{
    programs.git = {
        enable = true;
        settings.user = {
            name = "W-DevEndd";
            email = "111259650+W-DevEndd@users.noreply.github.com";
        };
    };
}
