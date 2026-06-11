{ pkgs, ... }:

{
  home.packages = [ pkgs.dropbox ];

  systemd.user.services.dropbox = {
    Unit = {
      Description = "Dropbox sync client";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };

    Service = {
      ExecStart = "${pkgs.dropbox}/bin/dropbox";
      Restart = "on-failure";
      RestartSec = 5;
    };

    Install.WantedBy = [ "graphical-session.target" ];
  };
}
