{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    discord
    qalculate-qt
    telegram-desktop
    yubioath-flutter
    spotify
  ];
}
