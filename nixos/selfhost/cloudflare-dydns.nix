{config, ...}: {
  services.cloudflare-dyndns = {
    enable = true;
    domains = ["1gnis.me"];
    apiTokenFile = "${config.sops.secrets.cloudflare_api_key.path}";
    proxied = true;
  };
  sops.secrets.cloudflare_api_key = {};
}
