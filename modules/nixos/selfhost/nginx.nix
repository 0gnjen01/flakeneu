{
  config,
  lib,
  ...
}: {
  options.nginx = {
    enable = lib.mkEnableOption "enables nginx";
  };
  config = lib.mkIf config.nginx.enable {
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
      defaults.email = "ognjenk0l3@gmail.com";
    };
  };
}
