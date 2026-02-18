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
    networking.firewall.allowedTCPPorts = [80 443];

    services.nextcloud = {
      enable = true;
      configureRedis = true;
      hostName = "nextcloud.1gnis.me";
      package = pkgs.nextcloud32;
      extraApps = {
        inherit (config.services.nextcloud.package.packages.apps) news contacts calendar tasks notes;
      };

      config.adminpassFile = "${config.sops.secrets.nextcloud_password.path}";
      config.dbtype = "sqlite";
      https = true;
      settings = {
        trusted_domains = ["nextcloud.1gnis.me"];
      };
    };

    sops.secrets.nextcloud_password = {};

    services.nginx.virtualHosts.${config.services.nextcloud.hostName} = {};
  };
}
