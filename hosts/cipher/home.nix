{
  config,
  dotfiles,
  lib,
  pi,
  ...
}:

{
  imports = [
    pi.homeModules.default

    ../../modules/home/1password.nix
    ../../modules/home/browser-defaults.nix
    ../../modules/home/dropbox.nix
    ../../modules/home/git.nix
    ../../modules/home/gnome.nix
    ../../modules/home/ghostty.nix
    ../../modules/home/gui-apps.nix
    ../../modules/home/helium.nix
    ../../modules/home/neovim.nix
    ../../modules/home/packages.nix
    ../../modules/home/pi.nix
    ../../modules/home/shell.nix
    ../../modules/home/tmux.nix
    ../../modules/home/zed.nix
    ../../modules/home/vscode.nix
  ];

  home = {
    inherit (dotfiles) username;
    homeDirectory = "/home/${dotfiles.username}";
    stateVersion = "26.05";

    sessionVariables = {
      LESSHISTFILE = "$XDG_STATE_HOME/less/history";
      PAGER = "less";
      SQLITE_HISTORY = "$XDG_STATE_HOME/sqlite/history";
    };
  };

  programs.home-manager.enable = true;
  home.preferXdgDirectories = true;
  xdg.enable = true;

  home.activation.createStateDirectories = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    run mkdir -p \
      ${lib.escapeShellArg "${config.xdg.stateHome}/less"} \
      ${lib.escapeShellArg "${config.xdg.stateHome}/sqlite"}
  '';
}
