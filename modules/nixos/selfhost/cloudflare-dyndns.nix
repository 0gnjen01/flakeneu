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
      domains = ["1gnis.me" "xmpp.1gnis.me"];
      apiTokenFile = config.sops.secrets.cloudflare_api_key.path;
    };
    sops.secrets.cloudflare_api_key = {};
  };
}
