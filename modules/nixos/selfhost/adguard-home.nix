{...}: {
  services.adguardhome = {
    enable = true;
    host = "127.0.0.1";
    port = 3003;
    openFirewall = true;
    allowDHCP = true;
    settings = {
      dns = {
        upstream_dns = [
          "9.9.9.9#dns.quad9.net"
          "149.112.112.112#dns.quad9.net"
        ];
      };
      filtering = {
        protection_enabled = true;
        filtering_enabled = true;

        safe_search = {
          enabled = false;
        };
      };
      filters =
        map (url: {
          enabled = true;
          url = url;
        }) [
          "https://adguardteam.github.io/HostlistsRegistry/assets/filter_9.txt" # The Big List of Hacked Malware Web Sites
          "https://adguardteam.github.io/HostlistsRegistry/assets/filter_11.txt" # malicious url blocklist
        ];
    };
  };
}
