{ config, pkgs, lib, ... }:
{
    wayland.windowManager.hyprland.enable = true;
    wayland.windowManager.hyprland.xwayland.enable = true;

    wayland.windowManager.hyprland.settings = {
        {
            mod = {
                _var = "SUPER";
            };

            config = {
                general = {
                    gaps_in = 3;
                    gaps_out = 6;
                    border_size = 21;

                    col = {
                        active_border   = "rgb(137, 180, 250)";
                        inactive_border = "rgb(17, 17, 27)";
                    };
                };

                decoration = {
                    rounding = 10;
                };
            };

            bind = [
            {
                _args = [
                    (lib.generators.mkLuaInline "mod .. \" + Q\"")
                        (lib.generators.mkLuaInline "hl.dsp.window.close()")
                        { locked = true; }
                ];
            }
            {
                _args = [
                    "SUPER + RETURN"
                        (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"kitty\")")
                ];
            }
            {
                _args = [
                    "ALT + R"
                        (lib.generators.mkLuaInline "hl.dsp.submap(\"resize\")")
                ];
            }
            ];

            define_submap = {
                _args = [
                    "resize"
                        (lib.generators.mkLuaInline "function()\n  hl.bind(\"right\", hl.dsp.window.resize({ x = 10, y = 0, relative = true }), { repeating = true })\n  hl.bind(\"left\", hl.dsp.window.resize({ x = -10, y = 0, relative = true }), { repeating = true })\n  hl.bind(\"escape\", hl.dsp.submap(\"reset\"))\nend")
                ];
            };

            window_rule = {
                match.class = "kitty";
                border_size = 2;
            };

            on = {
                _args = [
                    "hyprland.start"
                        (lib.generators.mkLuaInline "function()\n  hl.exec_cmd(\"waybar\")\nend")
                ];
            };
        }
    }

    imports = [
        ../programs/kitty.nix
    ];
}
