{
  config,
  lib,
  pkgs,
  ...
}: let
  domain = "bitwarden.1gnis.me";
in {
  options.vaultwarden = {
    enable = lib.mkEnableOption "enables vaultwarden";
  };
  config = lib.mkIf config.vaultwarden.enable {
    services = {
      vaultwarden = {
        enable = true;
        backupDir = "/var/local/vaultwarden/backup";
        # in order to avoid having  ADMIN_TOKEN in the nix store it can be also set with the help of an environment file
        # be aware that this file must be created by hand (or via secrets management like sops)
        config = {
          # Refer to https://github.com/dani-garcia/vaultwarden/blob/main/.env.template
          DOMAIN = "https://${domain}";
          SIGNUPS_ALLOWED = false;

          ROCKET_ADDRESS = "127.0.0.1";
          ROCKET_PORT = 8222;
          ROCKET_LOG = "critical";

          # This example assumes a mailserver running on localhost,
          # thus without transport encryption.
          # If you use an external mail server, follow:
          #   https://github.com/dani-garcia/vaultwarden/wiki/SMTP-configuration
          SMTP_HOST = "127.0.0.1";
          SMTP_PORT = 25;
          SMTP_SSL = false;

          SMTP_FROM = "admin@${domain}";
          SMTP_FROM_NAME = "1gnis.com Bitwarden server";
        };
      };
    };
    nginx.virtualHosts."${domain}" = {
      enableACME = true;
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://127.0.0.1:${toString config.services.vaultwarden.config.ROCKET_PORT}";
      };
    };
  };
}
