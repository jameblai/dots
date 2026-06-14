{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    vesktop
    prismlauncher
    qalculate-qt
    telegram-desktop
    yubioath-flutter
    spotify
  ];
}
