{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
    };
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    libinput.enable = true;
    libinput.mouse.accelProfile = "flat";
  };

  environment.systemPackages = [
    pkgs.gnomeExtensions.appindicator
    pkgs.gnomeExtensions.blur-my-shell
    pkgs.gnomeExtensions.dash-to-dock
  ];

  environment.etc."libinput/local-overrides.quirks".text = ''
    [Never Debounce]
    MatchUdevType=mouse
    ModelBouncingKeys=1
  '';

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
  security.rtkit.enable = true;

  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  fonts = {
    enableDefaultPackages = true;
    packages = [ pkgs.nerd-fonts.symbols-only ];
  };
}
