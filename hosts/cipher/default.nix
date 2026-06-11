{ config, self, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ../../modules/nixos/base.nix
    ../../modules/nixos/desktop.nix
    ../../modules/nixos/hardware.nix
    ../../modules/nixos/programs.nix
    ../../modules/nixos/services.nix
  ];

  networking.hostName = "cipher";
  time.timeZone = "Pacific/Auckland";
  i18n.defaultLocale = "en_NZ.UTF-8";
  console.keyMap = "us";

  hardware = {
    cpu.amd.updateMicrocode = true;
    nvidia = {
      open = true;
      modesetting.enable = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  system.configurationRevision = self.shortRev or self.dirtyShortRev or "dirty";
}
