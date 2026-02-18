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
      cloudflared = {
        enable = true;
        tunnels = {
          "d305c4b3-57c2-455a-bf9c-d35fa50a099c" = {
            credentialsFile = "/home/ignis/cred.json";
            default = "http_status:404";
            ingress = {
              "ssh.1gnis.me" = "ssh://localhost:22";
              "nextcloud.1gnis.me" = "http://localhost:80";
              "microbin.1gnis.me" = "http://localhost:80";
              "immich.1gnis.me" = "http://localhost:80";
              "git.1gnis.me" = "http://localhost:80";
            };
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
    programs.ssh = {
      extraConfig = ''
        Host git.1gnis.me
          HostName ssh.1gnis.me
          User git
          ProxyCommand cloudflared access ssh --hostname %h
          IdentityFile ~/.ssh/id_ed25519
      '';
    };
  };
}
