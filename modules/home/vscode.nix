{ pkgs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
    userSettings = {
      "editor.fontFamily" = "TX-02, 'Symbols Nerd Font'";
      "editor.fontSize" = 18;
      "terminal.integrated.fontFamily" = "TX-02, 'Symbols Nerd Font'";
      "terminal.integrated.fontSize" = 15;
    };
  };
}
