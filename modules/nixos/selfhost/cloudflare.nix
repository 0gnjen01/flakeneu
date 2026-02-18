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
        proxied = false;
      };
      cloudflared = {
        tunnels = {
          "d305c4b3-57c2-455a-bf9c-d35fa50a099c" = {
            credentialsFile = "${config.sops.secrets.cloudflare.path}";
            default = "http_status:404";
          };
        };
      };
      openssh.settings.Macs = [
        # Current defaults:
        "hmac-sha2-512-etm@openssh.com"
        "hmac-sha2-256-etm@openssh.com"
        "umac-128-etm@openssh.com"
        # Added:
        "hmac-sha2-256"
      ];
    };

    sops.secrets = {
      cloudflare = {
        sopsFile = ../../../secrets/cloudflare.env;
        format = "dotenv";
      };
      cloudflare_api_key = {};
    };
  };
}
