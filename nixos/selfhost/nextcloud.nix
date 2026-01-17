{...}: {
  services.nextcloud = {
    enable = true;
    hostName = "1gnis";
    config.adminpassFile = "";
    config.dbtype = "sqlite";
  };
  sops.secrets.nextcloud_password = {};
}
