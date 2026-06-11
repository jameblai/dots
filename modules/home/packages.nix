{ pkgs, ... }:

{
  home.packages = with pkgs; [
    codex
    jq
    ripgrep
    tree
    unzip
    wl-clipboard
    zip
  ];
}
