{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    discord
    prismlauncher
    qalculate-qt
    telegram-desktop
    yubioath-flutter
    spotify
  ];
}
