{
  config,
  lib,
  pkgs,
  ...
}: {
  options.sops-nix = {
    enable = lib.mkEnableOption "enables sops-nix";
  };

  config = lib.mkIf config.sops-nix.enable {
    environment.systemPackages = [pkgs.sops];
    sops = {
      defaultSopsFile = ./secrets.yaml;
      defaultSopsFormat = "yaml";

      useSystemdActivation = true;

      age.keyFile = "/home/ignis/.config/sops/age/keys.txt";
    };
    systemd.services.sops-install-secrets.after = ["local-fs.target"];
  };
}
