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
    networking.firewall.interfaces.tailscale0.allowedTCPPorts = [8080];

    services.nextcloud = {
      enable = true;
      hostName = "nextcloud.1gnis.me";
      package = pkgs.nextcloud32;
      config.adminpassFile = "${config.sops.secrets.nextcloud_password.path}";
      config.dbtype = "sqlite";
      https = true;
      settings = {
        trusted_domains = ["nextcloud.1gnis.me"];
      };
    };

    sops.secrets.nextcloud_password = {};

    services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {
      forceSSL = true;
      enableACME = true;
    };

    security.acme = {
      certs = {
        ${config.services.nextcloud.hostName}.email = "ognjenk0l3@gmail.com";
      };
    };
  };
}
