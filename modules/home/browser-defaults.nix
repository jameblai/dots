{ dotfiles, ... }:

let
  browserDesktop = dotfiles.browser.desktop;
in
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = [ browserDesktop ];
      "x-scheme-handler/about" = [ browserDesktop ];
      "x-scheme-handler/http" = [ browserDesktop ];
      "x-scheme-handler/https" = [ browserDesktop ];
      "x-scheme-handler/unknown" = [ browserDesktop ];
    };
  };

  home.sessionVariables.BROWSER = dotfiles.browser.command;
}
