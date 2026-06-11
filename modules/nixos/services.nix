_:

{
  services.tailscale = {
    enable = true;
    openFirewall = true;
    useRoutingFeatures = "client";
  };
  programs.yubikey-manager.enable = true;

  networking.nftables.enable = true;
}
