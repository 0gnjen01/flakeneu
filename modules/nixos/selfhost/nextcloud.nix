{
  config,
  lib,
  pkgs,
  ...
}: {
  options.nextcloud = {
    enable = lib.mkEnableOption "enables nextcloud";
  };
  config = lib.mkIf config.nextcloud.enable {
    networking.firewall.allowedTCPPorts = [8080];

    services.nextcloud = {
      enable = true;
      hostName = "nixos";
      package = pkgs.nextcloud32;
      config.adminpassFile = "${config.sops.secrets.nextcloud_password.path}";
      config.dbtype = "sqlite";
    };

    sops.secrets.nextcloud_password = {};
  };
}
