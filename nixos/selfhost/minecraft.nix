{pkgs, ...}: {
  services.minecraft-server = {
    enable = true;
    eula = true;
    package = pkgs.minecraftServers.vanilla-1-12;
    jvmOpts = ''-Xms4092M -Xmx4092M -XX:+UseConcMarkSweepGC -XX:ParallelGCThreads=4 -XX:+DisableExplicitGC -XX:+CMSIncrementalMode -Dsun.rmi.dgc.server.gcInterval=2147483646 -XX:+UnlockExperimentalVMOptions -XX:MaxGCPauseMillis=35'';
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
