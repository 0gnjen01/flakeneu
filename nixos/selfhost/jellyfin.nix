{...}: {
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "ignis";
  };

  services.nginx.virtualHosts."jellyfin.1gnis.me" = {
    forceSSL = true;
    enableACME = true;
    locations."/" = {
      proxyPass = "http://127.0.0.1:8096";
      proxyWebsockets = true;
    };
  };

  security.acme = {
    certs."jellyfin.1gnis.me" = {};
  };
}
