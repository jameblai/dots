{
  config,
  lib,
  pkgs,
  ...
}:

let
  onePasswordSocket = "${config.home.homeDirectory}/.1password/agent.sock";
in
{
  home.sessionVariables.SSH_AUTH_SOCK = onePasswordSocket;

  programs = {
    ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings."*" = {
        IdentityAgent = onePasswordSocket;
        AddKeysToAgent = "no";
        Compression = false;
        ServerAliveInterval = 60;
        ServerAliveCountMax = 3;
      };
    };

    git = {
      enable = true;
      signing = {
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIISw+UZpoMEQXWEjstxi+/Y3m7RH2o3no9fLWorErf5U";
        format = "ssh";
        signByDefault = true;
        signer = lib.getExe' pkgs._1password-gui "op-ssh-sign";
      };
      settings = {
        user = {
          name = "James Blair";
          email = "james@blair.nz";
        };
        init.defaultBranch = "main";
        core.editor = "nvim";
        merge.conflictStyle = "zdiff3";
        push = {
          autoSetupRemote = true;
          default = "current";
        };
        url."git@github.com:".insteadOf = [
          "https://github.com/"
          "http://github.com/"
        ];
        pull.rebase = true;
        rebase.autoStash = true;
        diff = {
          algorithm = "histogram";
          colorMoved = "default";
        };
        alias = {
          a = "add";
          cm = "commit";
          co = "checkout";
          d = "diff";
          hist = "log --graph --date=relative --decorate --all --pretty=format:'%Cgreen%h %Creset%cd %Cblue[%cn] %Creset%s%C(yellow)%d%C(reset)'";
          open = "!gh browse";
          st = "status";
        };
      };
      ignores = [
        ".env"
        ".env.local"
        ".idea/"
        ".vscode/"
        "*.swp"
        "*.swo"
        "*~"
        "__pycache__/"
        "node_modules/"
      ];
    };

    delta = {
      enable = true;
      enableGitIntegration = true;
      options = {
        navigate = true;
        side-by-side = false;
      };
    };

    gh = {
      enable = true;
      gitCredentialHelper.enable = false;
    };
  };
}
