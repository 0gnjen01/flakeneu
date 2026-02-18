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
    };

    sops.secrets = {
      cloudflare_api_key = {};
    };
  };
}
