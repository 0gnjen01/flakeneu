{...}: {
  networking.firewall = {
    enable = true;
  };
  users.users.ignis.extraGroups = ["docker"];
  virtualisation.docker = {
    enable = true;
    daemon.settings = {
      experimental = true;
    };
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
}
