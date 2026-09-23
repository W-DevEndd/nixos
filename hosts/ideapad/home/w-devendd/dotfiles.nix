{ inputs, pkgs, config, lib,... }:
let
    repo = "https://github.com/w-devendd/dotfiles.git";
    targetDir = "${config.home.homeDirectory}/dotfiles";
in
{
    options."w-devendd" = {
        dotfilesRoot = lib.mkOption {
            type = lib.types.str;
            default = targetDir;
            description = "dotfiles root dir";
        };
    };
    config = {
        home.activation = {
            handleDotfilesClone = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
                if [ ! -d "${targetDir}" ]; then
                    echo "[Nix Hook] Linking dotfiles to ${targetDir}..."
                    ln -s ${inputs.w-devendd-dotfiles} ${targetDir}
                    echo "[Nix Hook] Dotfiles has been linked readonly, enable network to reclone it."
                else
                    echo "[Nix Hook] dotfiles already exists in ${targetDir}, skipped."
                fi
            '';
        };
        systemd.user.services.cloneDotfiles = {
            Unit = {
                Description = "Clone dotfiles";
                After = "network-online.target";
                Wants = "network-online.target";
            };
            Install = {
                WantedBy = ["default.target"];
            };
            Service = {
                Type = "oneshot";
                RemainAfterExit = true;

                ExecStart = "${pkgs.writeShellScript "setup-dotfiles-symlink"''
                    if [ -d "${targetDir}/.git" ]; then exit 0; fi
                    echo "Checking for Network..."
                    ${pkgs.iputils}/bin/ping -c 1 -W 2 github.com &>/dev/null
                    echo "Cloning dotfiles from github..."
                    rm -rf ${targetDir}
                    ${pkgs.git}/bin/git clone ${repo} ${targetDir}
                ''}";
            };
        };
    };
}
