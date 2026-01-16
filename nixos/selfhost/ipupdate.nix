{pkgs, ...}: {
  systemd.timers."ipupdate" = {
    wantedBy = ["timers.target"];
    timerConfig = {
      OnBootSec = "5m";
      OnUnitActiveSec = "5m";
      Unit = "ipupdate.service";
    };
  };

  systemd.services."ipupdate" = {
    script = ''
      ${pkgs.curl}/bin/curl   \
      -X PATCH \
      -H 'Content-Type: application/json' \
      -H "Authorization: Bearer " \
      -d '{
            "name": "1gnis.me",
            "ttl": 3600,
            "type": "A",
            "comment": "Domain verification record",
            "content": "178.223.4.93",
            "proxied": true
          }'
    '';
    serviceConfig = {
      Type = "oneshot";
      User = "ignis";
    };
  };
  sops.secrets.cloudflare_api_key = {};
}
