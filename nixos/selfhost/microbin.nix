{config, ...}: {
  networking.firewall.allowedTCPPorts = [80 443];
  services = {
    microbin = {
      enable = true;
      passwordFile = "${config.secrets.microbin_password.path}";
      settings = {
        MICROBIN_BIND = "127.0.0.1";
        MICROBIN_PORT = 8080;
        MICROBIN_PUBLIC_PATH = "https://microbin.1gnis.me";
        MICROBIN_ENCRYPTION_CLIENT_SIDE = true;
        MICROBIN_ENCRYPTION_SERVER_SIDE = true;
        MICROBIN_HASH_IDS = true;
        MICROBIN_DISABLE_TELEMETRY = true;
        MICROBIN_QR = true;
        MICROBIN_NO_LISTING = true;
      };
    };
    nginx = {
      enable = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
      virtualHosts."microbin.1gnis.me" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyWebsockets = true;
          proxyPass = "http://127.0.0.1:8080";
        };
      };
    };
  };
  security.acme = {
    acceptTerms = true;
    defaults.email = "ognjenk0l3@gmail.com";
    certs."microbin.1gnis.me" = {};
  };
  sops.secrets.microbin_password = {};
}
