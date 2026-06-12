{ config, dotfiles, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    history = {
      append = true;
      expireDuplicatesFirst = true;
      ignoreAllDups = true;
      ignoreSpace = true;
      path = "${config.xdg.stateHome}/zsh/history";
      save = 10000;
      size = 10000;
      share = true;
    };
    shellAliases = {
      cat = "bat";
      grep = "rg";
      la = "eza -la --group-directories-first";
      ll = "eza -l --group-directories-first";
      ls = "eza --group-directories-first";
      rebuild = "just --justfile ${dotfiles.repoPath}/justfile switch";
      update = "just --justfile ${dotfiles.repoPath}/justfile update";
    };
    prezto = {
      enable = true;
      editor = {
        keymap = "vi";
        dotExpansion = true;
      };
      pmodules = [
        "environment"
        "terminal"
        "editor"
        "history"
        "directory"
        "spectrum"
        "utility"
        "completion"
        "git"
        "syntax-highlighting"
        "autosuggestions"
        "history-substring-search"
        "prompt"
      ];
      prompt = {
        theme = "pure";
        showReturnVal = true;
      };
      syntaxHighlighting.highlighters = [
        "main"
        "brackets"
        "pattern"
      ];
    };
  };

  programs = {
    bat.enable = true;
    eza.enable = true;
    fastfetch.enable = true;
    fd.enable = true;
    fzf = {
      enable = true;
      enableZshIntegration = true;
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };
  };
}
