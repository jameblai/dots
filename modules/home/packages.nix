{ pkgs, ... }:

{
  home.packages = with pkgs; [
    jq
    ripgrep
    tree
    unzip
    wl-clipboard
    zip
  ];
}
