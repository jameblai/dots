{
  helium,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    discord
    dropbox
    helium.packages.${pkgs.stdenv.hostPlatform.system}.default
    tidal-hifi
    telegram-desktop
    yubioath-flutter
  ];

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
