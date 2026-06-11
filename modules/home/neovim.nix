{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    extraPackages = with pkgs; [
      fd
      gcc
      git
      gnumake
      lua-language-server
      nodejs
      ripgrep
      tree-sitter
      typescript-language-server
      wl-clipboard
    ];
  };

  xdg.configFile = {
    "nvim/init.lua".source = ../../config/nvim/init.lua;
    "nvim/lazy-lock.json".source = ../../config/nvim/lazy-lock.json;
  };
}
