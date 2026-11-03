{ pkgs, config, lib, ... }: let
    rclone = pkgs.rclone;
    mountPoint = "${config.home.homeDirectory}/OneDrive";
in {
    programs.rclone.enable = true;
    programs.rclone.package = rclone;

    systemd.user.services."rclone-onedrive-mount" = {
        Unit = {
            Description = "Mount OneDrive by Rclone";
            After = "network-online.target";
            Wants = "network-online.target";
        };
        Install = {
            WantedBy = ["default.target"];
        };
        Service = {
            Type = "simply";
            ExecStartPre="${pkgs.coreutils}/bin/mkdir -p ${mountPoint}";
            ExecStart = ''
            ${rclone}/bin/rclone mount onedrive: ${mountPoint} \
                --cache-dir=%C/rclone \
                --vfs-cache-mode=full \
                --vfs-cache-max-size=10G \
                --vfs-read-chunk-size=32Mi
            '';
            ExecStop = "/run/current-system/sw/bin/fusermount -u /home/w-devendd/OneDrive";
        };
    };
}
