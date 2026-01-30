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

    services.minecraft-servers = {
      enable = true;
      eula = true;
      openFirewall = true;
      servers = {
        vanilla = {
          enable = true;
          autoStart = false;
          package = pkgs.fabricServers.fabric-1_20_1;
          jvmOpts = ''-Xms6G -Xmx6G -XX:+UseZGC -XX:+ZGenerational'';
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
          symlinks = {
            mods = pkgs.linkFarmFromDrvs "mods" (builtins.attrValues {
              Skin-Restorer = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/ghrZDhGW/versions/b8GoBEZd/skinrestorer-2.5.0%2B1.20-fabric.jar";
                sha512 = "sha512-z4usRPp/4JVO/Jy5Z13UnoFH+7s6PCjJ2+Wz2KGXl48Kb8DNuCr0XmXjLT2qme5kRqnsfmGqLwVLSZs3O+wcGQ";
              };
              Distant-Horizons = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/uCdwusMi/versions/lC6CwqPp/DistantHorizons-2.4.5-b-1.20.1-fabric-forge.jar";
                sha512 = "sha512-Z5y2+bVdfupDwX8CBAQhQFkN5xKwzs3BQBboBkqYRmleL0OJIjd/ZY4mU0xJy2Hm2pOaa+U8LLHNG8CItp2z7g";
              };
              Chunky = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/fALzjamp/versions/NHWYq9at/Chunky-1.3.146.jar";
                sha512 = "sha512-nbuCmTMCqN++bOH0agUdcrWtqSRCT04jZ0zmYNIJJXWEFZozJI+pJHeT6boD06EXKZzh/2aF8Gp/uHyWUERZqg";
              };
              Fabric-API = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/P7dR8mSH/versions/L6LGItxd/fabric-api-0.92.7%2B1.20.1.jar";
                sha512 = "sha512-y6Hqy+HySTBwJaeA7Tt2mBuE+wXgICOUJCXZpyBRLAmRN5GaLKMX/fuNaIUM2U2Bzu+sehWmoaHvysz9Fv6qrQ";
              };
              Noisium = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/KuNKN7d2/versions/erSJnRcq/noisium-fabric-2.3.0%2Bmc1.20-1.20.1.jar";
                sha512 = "sha512-8KvNrFFL0rTravNSnuuZgKb+9TTTEkSHmsspGplDFRrrNPNyv5iuAfYZGHC/leHAvDbVIkMzU6EJC5bnrAPEFw";
              };
              Lithium = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/gvQqBUqZ/versions/iEcXOkz4/lithium-fabric-mc1.20.1-0.11.4.jar";
                sha512 = "sha512-MZOLfoSWCYkv+hcQ5B8uFj0Rh2+CRFJUBljEtTzRPGZtva2NIAmJRhkyvZlSgUxZQ+ZCUlMMcr3V2GQXdRUVAA";
              };
              ModernFix = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/nmDcB62a/versions/rPmgLeZC/modernfix-fabric-5.25.2%2Bmc1.20.1.jar";
                sha512 = "sha512-h4450YJ2f/0IrWo1OfrngHORKdsTOr4Cubc9w99uGsndvlCWIDVrCq5ee/vtU10OGHQXAzNDF6Fv7++CAmnaLQ";
              };
              FerriteCore = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/uXXizFIs/versions/unerR5MN/ferritecore-6.0.1-fabric.jar";
                sha512 = "sha512-m33Ghr+nk3gV2Ix7vGkIhXzWZGsF56lt29ytoyijhb1LoFZTLNHX350tf0Jl/Ui9Sf9oPyF/bU6BcXe4f2vEVw";
              };
              Memory-Leak-Fix = pkgs.fetchurl {
                url = "https://cdn.modrinth.com/data/NRjRiSSD/versions/5xvCCRjJ/memoryleakfix-fabric-1.17%2B-1.1.5.jar";
                sha512 = "sha512-p790KTQNB29LMGArxxQoDD9cuOgU526JKWyBVeM1WzMwShSOkhg3ijODEn6Vt7pHQCUGxofx1YYJcE/ozGCrkw";
              };
            });
          };
        };
      };
    };
  };
}
