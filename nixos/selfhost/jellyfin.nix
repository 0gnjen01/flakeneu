{config, ...}: {
  services.jellyfin = {
    enable = true;
    openFirewall = true;
    user = "1gnis";
    hardwareAcceleration = {
      enable = true;
      type = "nvenc";
    };
  };

  services.nginx.virtualHosts.${config.services.jellyfin.user} = {
    forceSSL = true;
    enableACME = true;
  };

  security.acme = {
    certs = {
      ${config.services.jellyfin.user}.email = "ognjenk0l3@gmail.com";
    };
  };
}
