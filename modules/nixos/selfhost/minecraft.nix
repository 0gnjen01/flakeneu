{
  config,
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [inputs.nix-minecraft.nixosModules.minecraft-servers];

  options.minecraft = {
    enable = lib.mkEnableOption "enables minecraft";
  };

  config = lib.mkIf config.minecraft.enable {
    nixpkgs.overlays = [inputs.nix-minecraft.overlay];

    networking.firewall = {
      allowedTCPPorts = [25565];
      allowedUDPPorts = [25565];
    };

    services.minecraft-servers = {
      enable = true;
      eula = true;
      openFirewall = true;
      servers = {
        vanilla = {
          autoStart = false;
          enable = true;
          package = pkgs.paperServers.paper-1_12_2;
          jvmOpts = ''-Xms4G -Xmx4G -XX:+UseG1GC'';
          operators = {
            ognjen = "14366532-0366-48a7-a092-b66023910f2b";
          };
          serverProperties = {
            server-port = 25565;
            difficulty = 3;
            gamemode = 0;
            max-world-size = 2000;
            simulation-distance = 4;
            view-distance = 8;
            spawn-protection = 0;
            online-mode = false;
            motd = "1gnis's §lMC §r server hosted on §bNix§fOS!";
          };
        };
      };
    };
  };
}
