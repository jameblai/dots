{ pkgs, ... }:

{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "us";
    };
    desktopManager.plasma6.enable = true;
    displayManager.plasma-login-manager.enable = true;
    libinput.enable = true;
    libinput.mouse.accelProfile = "flat";
  };

  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    elisa
    gwenview
    kate
    khelpcenter
    konsole
    krdp
    okular
    plasma-keyboard
    plasma-workspace-wallpapers
    qtvirtualkeyboard
  ];

  programs.kde-pim.enable = false;

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
