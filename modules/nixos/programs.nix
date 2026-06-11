{ pkgs, username, ... }:

{
  programs = {
    steam = {
      enable = true;
      remotePlay.openFirewall = false;
      dedicatedServer.openFirewall = false;
      localNetworkGameTransfers.openFirewall = false;
      extraCompatPackages = [ pkgs.proton-ge-bin ];
    };
    gamemode.enable = true;

    _1password.enable = true;
    _1password-gui = {
      enable = true;
      polkitPolicyOwners = [ username ];
    };
  };

  environment.etc = {
    "1password/custom_allowed_browsers" = {
      text = ''
        helium
      '';
      mode = "0755";
    };
  };
}
