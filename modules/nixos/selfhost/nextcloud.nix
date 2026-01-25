{
  config,
  pkgs,
  ...
}: {
  services.nextcloud = {
    enable = true;
    hostName = "1gnis";
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
}
