{...}: {
  networking.firewall.allowedTCPPorts = [80 443];
  services.nginx = {
    enable = true;
    recommendedTlsSettings = true;
    recommendedOptimisation = true;
    recommendedGzipSettings = true;
    recommendedUwsgiSettings = true;
    recommendedProxySettings = true;
    recommendedBrotliSettings = true;
  };
  security.acme = {
    acceptTerms = true;
    defaults.email = "ognjenk0l3@gmail.com";
  };
}
