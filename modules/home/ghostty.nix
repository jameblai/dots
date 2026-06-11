{ dotfiles, ... }:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      quit-after-last-window-closed = true;
      shell-integration = "zsh";
      theme = "Vesper";
      font-family = dotfiles.font.mono;
      font-size = 15;
      window-padding-x = 8;
      window-padding-y = 8;
      cursor-style = "block";
      cursor-style-blink = false;
      shell-integration-features = "no-cursor";
      mouse-hide-while-typing = true;
      keybind = [ "shift+enter=text:\\n" ];
    };
  };
}
