{config, ...}: {
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [25565];
    allowedUDPPorts = [25565];
  };
  sops.secrets.curseforge_api_key = {};
  virtualisation.oci-containers = {
    backend = "docker";
    containers."minecraft-server" = {
      image = "itzg/minecraft-server:java21";
      ports = ["25565:25565"];
      environment = {
        EULA = "TRUE";
        MEMORY = "6G";
        USE_MEOWICE_GRAALVM_FLAGS = "true";
        VERSION = "1.20.1";
        CF_API_KEY = "$2a$10$7cTX94wVNlC69dTD2G/5weh/XaBGy8Z5ICSC4wJPzUbXrIcMNi1eG";
        CF_PAGE_URL = "https://www.curseforge.com/minecraft/modpacks/cabin";
        MODPACK_PLATFORM = "AUTO_CURSEFORGE";
        TYPE = "FORGE";
        MOTD = "1gnis's §lMC §r server hosted on §bNix§fOS!";
      };
      volumes = [
        "./data:/data"
      ];
    };
  };
}
