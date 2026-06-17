{ pkgs, ... }:

{
  home.packages = with pkgs; [
    awscli2
    btop
    codex
    fastfetch
    jq
    libreoffice
    ripgrep
    tree
    unzip
    wl-clipboard
    zip
  ];
}
