{
  config,
  lib,
  ...
}: let
  domainName = "1gnis.me";
in {
  options.nginx = {
    enable = lib.mkEnableOption "enables nginx";
  };
  config = lib.mkIf config.nginx.enable {
    sops.secrets.cloudflare = {
      sopsFile = ../../../secrets/cloudflare.env;
      format = "dotenv";
      owner = "acme";
      group = "acme";
    };

    networking.firewall.allowedTCPPorts = [80 443];

    services.nginx = {
      enable = true;
      recommendedTlsSettings = true;
      recommendedOptimisation = true;
      recommendedGzipSettings = true;
      recommendedUwsgiSettings = true;
      recommendedProxySettings = true;
      recommendedBrotliSettings = true;
      clientMaxBodySize = "1G";
      virtualHosts."${domainName}" = {
        forceSSL = true;
        useACMEHost = "${domainName}";
      };
    };
    security.acme = {
      acceptTerms = true;
      defaults = {
        email = "ognjenk0l3@gmail.com";
        group = config.services.nginx.group;
        dnsProvider = "cloudflare";
        environmentFile = "${config.sops.secrets.cloudflare.path}";
        reloadServices = [
          "nginx"
        ];
      };
    };
  };
}
