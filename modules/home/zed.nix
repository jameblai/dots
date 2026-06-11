{ dotfiles, pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    mutableUserSettings = false;
    extraPackages = with pkgs; [
      nil
      nodejs
      typescript-language-server
    ];
    extensions = [
      "nix"
      "vesper"
    ];
    userSettings = {
      ui_font_family = dotfiles.font.mono;
      buffer_font_family = dotfiles.font.mono;
      buffer_font_fallbacks = [ dotfiles.font.fallback ];
      vim_mode = true;
      base_keymap = "Cursor";
      ui_font_size = 18;
      buffer_font_size = 18;
      theme = "Vesper";
      outline_panel.dock = "right";
      project_panel.dock = "right";
      git_panel.dock = "right";
      collaboration_panel.dock = "right";
    };
  };
}
