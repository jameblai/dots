{
  config,
  lib,
  username,
  ...
}:

{
  imports = [
    ../../modules/home/git.nix
    ../../modules/home/ghostty.nix
    ../../modules/home/gui-apps.nix
    ../../modules/home/neovim.nix
    ../../modules/home/packages.nix
    ../../modules/home/shell.nix
    ../../modules/home/tmux.nix
    ../../modules/home/zed.nix
    ../../modules/home/vscode.nix
  ];

  home = {
    inherit username;
    homeDirectory = "/home/${username}";
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
