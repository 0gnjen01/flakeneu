{
  config,
  lib,
  ...
}: {
  options.nginx = {
    enable = lib.mkEnableOption "enables nginx";
  };
  config = lib.mkIf config.nginx.enable {
    sops.secrets.cloudflare_api_key = {};

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
    };
    security.acme = {
      acceptTerms = true;
      defaults = {
        email = "ognjenk0l3@gmail.com";
        dnsProvider = "cloudflare";
        credentialFiles = {
          "CLOUDFLARE_API_KEY_FILE" = "${config.sops.secrets.cloudflare_api_key.path}";
        };
      };
    };
  };
}
