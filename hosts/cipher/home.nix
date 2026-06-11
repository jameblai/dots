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
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "text/html" = [ "helium.desktop" ];
        "x-scheme-handler/about" = [ "helium.desktop" ];
        "x-scheme-handler/http" = [ "helium.desktop" ];
        "x-scheme-handler/https" = [ "helium.desktop" ];
        "x-scheme-handler/unknown" = [ "helium.desktop" ];
      };
    };

  home.sessionVariables.BROWSER = "helium";

  xdg.configFile."plasmashellrc".text = ''
      [PlasmaViews][Panel 2]
      floating=0

      [PlasmaViews][Panel 2][Defaults]
      thickness=46

      [Updates]
      performed=/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/containmentactions_middlebutton.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/digitalclock_migrate_font_settings.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/digitalclock_migrate_showseconds_setting.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/digitalclock_rename_timezonedisplay_key.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/folderview_fix_recursive_screenmapping.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/keyboardlayout_migrateiconsetting.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/keyboardlayout_remove_shortcut.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/klipper_clear_config.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/maintain_existing_desktop_icon_sizes.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/mediaframe_migrate_useBackground_setting.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/migrate_font_weights.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/move_desktop_layout_config.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/no_middle_click_paste_on_panels.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/systemloadviewer_systemmonitor.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/taskmanager_configUpdate_wheelEnabled.js,/run/current-system/sw/share/plasma/shells/org.kde.plasma.desktop/contents/updates/unlock_widgets.js
  '';

  home.activation.createStateDirectories = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    run mkdir -p \
      ${lib.escapeShellArg "${config.xdg.stateHome}/less"} \
      ${lib.escapeShellArg "${config.xdg.stateHome}/sqlite"}
  '';
}
