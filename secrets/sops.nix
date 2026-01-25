{
  config,
  lib,
  pkgs,
  ...
}: {
  options.sops = {
    enable = lib.mkEnableOption "enables sops-nix";
  };

  config = lib.mkIf config.sops.enable {
    environment.systemPackages = [pkgs.sops];
    sops = {
      defaultSopsFile = ./secrets.yaml;
      defaultSopsFormat = "yaml";

      age.keyFile = "/home/ignis/.config/sops/age/keys.txt";
    };
  };
}
