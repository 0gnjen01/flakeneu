{
  config,
  lib,
  ...
}: {
  options.tailscale = {
    enable = lib.mkEnableOption "enables tailscale";
  };

  config = lib.mkIf config.tailscale.enable {
    services = {
      tailscale = {
        enable = true;
        authKeyFile = config.sops.secrets.tailscale.path;
      };
    };
    networking.nftables.enable = true;
    networking.firewall = {
      enable = true;
      trustedInterfaces = ["tailscale0" "lo"];
      allowedUDPPorts = [config.services.tailscale.port];
    };

    systemd.services.tailscaled.serviceConfig.Environment = [
      "TS_DEBUG_FIREWALL_MODE=nftables"
    ];

    systemd.network.wait-online.enable = false;
    boot.initrd.systemd.network.wait-online.enable = false;
    sops.secrets.tailscale = {};
  };
}
