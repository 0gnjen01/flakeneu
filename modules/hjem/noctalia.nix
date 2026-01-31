{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  options.noctalia = {
    enable = lib.mkEnableOption "enables noctalia-shell";
  };
  config = lib.mkIf config.noctalia.enable {
    environment.systemPackages = with pkgs; [
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}
