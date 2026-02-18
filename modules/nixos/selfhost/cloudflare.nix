{
  config,
  lib,
  ...
}: {
  options.cloudflare = {
    enable = lib.mkEnableOption "enables cloudflare-dyndns and cloudflared";
  };

  config = lib.mkIf config.cloudflare.enable {
    services = {
      cloudflare-dyndns = {
        enable = true;
        domains = ["1gnis.me"];
        apiTokenFile = config.sops.secrets.cloudflare_api_key.path;
        proxied = true;
      };
      cloudflared = {
        enable = true;
        tunnels = {
          "d305c4b3-57c2-455a-bf9c-d35fa50a099c" = {
            credentialsFile = config.sops.secrets.cloudflared.path;
            default = "http_status:404";
            ingress = {
              "1gnis.me" = "http://localhost:80";
            };
          };
        };
      };
    };

    sops.secrets = {
      cloudflare_api_key = {};
      cloudflared = {
        sopsFile = ../../../secrets/cloudflared.json;
        format = "json";
        key = "";
        owner = "cloudflared";
        group = "cloudflared";
      };
    };
  };
}
