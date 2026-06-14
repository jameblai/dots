{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    discord
    lunar-client
    qalculate-qt
    telegram-desktop
    yubioath-flutter
    spotify
  ];
}
