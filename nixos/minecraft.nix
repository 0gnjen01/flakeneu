{pkgs, ...}: {
  services.minecraft-server = {
    enable = true;
    eula = true;
    package = pkgs.minecraft-server_1_7_3;
    jvmOpts = ''-Xms4092M -Xmx4092M'';
    declarative = true;
    serverProperties = {
      server-port = 25565;
      difficulty = 3;
      gamemode = 1;
      max-players = 5;
      motd = "NixOS Minecraft server!";
    };
  };
}
