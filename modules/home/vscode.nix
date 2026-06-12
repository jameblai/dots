{ dotfiles, pkgs, ... }:

let
  editorFontFamily = "${dotfiles.font.mono}, '${dotfiles.font.fallback}'";
in

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

    profiles.default = {
      extensions =
        with pkgs.vscode-extensions;
        [
          antfu.icons-carbon
          usernamehw.errorlens
          bradlc.vscode-tailwindcss
          esbenp.prettier-vscode
          vscodevim.vim
          vscode-icons-team.vscode-icons
        ]
        ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
          {
            name = "vesper";
            publisher = "raunofreiberg";
            version = "0.0.40";
            sha256 = "16jdwr4f320jfsaiqqllq7wjqj1n8cbwi3l27c4sg8bxl7lbi0i9";
          }
        ];

      userSettings = {
        "editor.fontFamily" = editorFontFamily;
        "editor.fontSize" = 18;
        "editor.defaultFormatter" = "esbenp.prettier-vscode";
        "editor.formatOnSave" = true;
        "editor.formatOnPaste" = true;
        "editor.linkedEditing" = true;
        "editor.minimap.enabled" = false;
        "editor.suggestSelection" = "recentlyUsedByPrefix";
        "editor.codeActionsOnSave" = {
          "source.fixAll" = "always";
          "source.organizeImports" = "always";
        };
        "files.autoSave" = "onFocusChange";
        "terminal.integrated.fontFamily" = editorFontFamily;
        "terminal.integrated.fontSize" = 15;
        "workbench.startupEditor" = "none";
        "workbench.iconTheme" = "vscode-icons";
        "workbench.productIconTheme" = "icons-carbon";
        "workbench.colorTheme" = "Vesper";
        "workbench.browser.openLocalhostLinks" = false;
        "workbench.sideBar.location" = "right";
        "workbench.secondarySideBar.defaultVisibility" = "hidden";
        "vsicons.dontShowNewVersionMessage" = true;
        "chat.agent.enabled" = false;
        "git.autofetch" = true;
        "git.confirmSync" = false;
        "git.enableSmartCommit" = true;
        "vim.useSystemClipboard" = true;
        "vim.smartRelativeLine" = true;
        "vim.highlightedyank.enable" = true;
      };
    };
  };
}
