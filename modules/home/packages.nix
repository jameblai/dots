{ pkgs, ... }:

{
  home.packages = with pkgs; [
    btop
    codex
    fastfetch
    jq
    ripgrep
    tree
    unzip
    wl-clipboard
    zip
  ];
}
