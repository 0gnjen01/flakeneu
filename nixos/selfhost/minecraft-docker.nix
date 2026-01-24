{pkgs, ...}: {
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [22565];
    allowedUDPPorts = [25565];
  };
  sops.secrets.curseforge_api_key = {};
  virtualisation.oci-containers = {
    backend = "docker";
    containers."minecraft-server" = {
      image = "itzg/minecraft-server:latest";
      ports = ["25565:25565"];
      environment = {
        EULA = "TRUE";
        MEMORY = "4G";
        USE_MEOWICE_GRAALVM_FLAGS = "true";
        VERSION = "1.20.1";
        CF_API_KEY = "$(${pkgs.coreutils}/bin/cat config.sops.secrets.curseforge_api_key.path)";
        CF_PAGE_URL = "https://www.curseforge.com/minecraft/modpacks/cabin";
        MODPACK_PLATFORM = "AUTO_CURSEFORGE";
        TYPE = "FORGE";
        MOTD = "1gnis's §lMC §r server hosted on §bNix§fOS!";
        ICON = "https://scontent.fbeg4-1.fna.fbcdn.net/v/t39.30808-6/480154359_122193366644117029_6803512805762580532_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=127cfc&_nc_ohc=lopw-tB7IRsQ7kNvwGdpr7s&_nc_oc=AdmdF6qD8t9PMsFl1kLBWxDkVc-yFAhiQo5saHXhoF0UVkR5_xPy1ZwSSezVm7Dhkx0&_nc_zt=23&_nc_ht=scontent.fbeg4-1.fna&_nc_gid=-9OPHFcWZ_JjEiU64wpEqw&oh=00_AfoweaJrJU7wdIaPGgJ0alHCZVfwAk8EM7EVClQdwWz06w&oe=6979C209";
      };
      volumes = [
        "./data:/data"
      ];
    };
  };
}
