{
  config,
  lib,
  pkgs,
  ...
}: {
  options.immich = {
    enable = lib.mkEnableOption "enables immich";
  };
  config = lib.mkIf config.immich.enable {
    users.users.immich.extraGroups = ["video" "render"];

    services = {
      immich = {
        enable = true;
        port = 2283;
        accelerationDevices = null;
      };
      nginx.virtualHosts."immich.1gnis.me" = {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://[::1]:${toString config.services.immich.port}";
          proxyWebsockets = true;
          recommendedProxySettings = true;
          extraConfig = ''
            client_max_body_size 50000M;
            proxy_read_timeout   600s;
            proxy_send_timeout   600s;
            send_timeout         600s;
          '';
        };
      };
    };
  };
}
