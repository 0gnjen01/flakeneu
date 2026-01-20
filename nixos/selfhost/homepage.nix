{...}: {
  services.homepage-dashboard = {
    enable = true;
    openFirewall = true;
    widgets = [
      {
        datetime = {
          format = {
            timeStyle = "short";
            hourCycle = "h23";
          };
        };
      }
      {
        resources = {
          cpu = true;
          cputemp = true;
          uptime = true;
          disk = "/";
          memory = true;
        };
      }
      {
        search = {
          provider = "duckduckgo";
          target = "_blank";
        };
      }
    ];
    services = [
      {
        "Cloud" = [
          {
            "NextCloud" = {
              description = "Drive";
              href = "https://nextcloud.1gnis.me";
            };
          }
        ];
      }
    ];
  };
}
