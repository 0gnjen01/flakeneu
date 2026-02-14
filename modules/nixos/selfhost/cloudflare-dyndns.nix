{
  config,
  lib,
  ...
}: {
  options.cloudflare-dyndns = {
    enable = lib.mkEnableOption "enables cloudflare-dyndns";
  };

  config = lib.mkIf config.cloudflare-dyndns.enable {
    services.cloudflare-dyndns = {
      enable = true;
      domains = ["home.1gnis.me" "mc.1gnis.me"];
      apiTokenFile = config.sops.secrets.cloudflare_api_key.path;
      proxied = true;
    };
    sops.secrets.cloudflare_api_key = {};
  };
}
