{
  config,
  helium,
  pkgs,
  ...
}:

let
  system = pkgs.stdenv.hostPlatform.system;

  widevine = pkgs.widevine-cdm;
  widevineVersion = widevine.version;

  heliumConfigDir = "${config.xdg.configHome}/net.imput.helium";
  heliumWidevineDir = "${heliumConfigDir}/WidevineCdm/${widevineVersion}";
in
{
  home.packages = [
    helium.packages.${system}.default
    widevine
  ];

  xdg.configFile."net.imput.helium/WidevineCdm/${widevineVersion}".source =
    "${widevine}/share/google/chrome/WidevineCdm";

  xdg.configFile."net.imput.helium/WidevineCdm/latest-component-updated-widevine-cdm".text =
    builtins.toJSON
      {
        Path = heliumWidevineDir;
      };
}
