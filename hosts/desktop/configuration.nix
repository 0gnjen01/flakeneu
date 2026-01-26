# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ../../modules
  ];

  cloudflare-dyndns.enable = true;
  microbin.enable = true;
  nginx.enable = true;
  minecraft.enable = true;

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  nix = let
    flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
  in {
    settings = {
      experimental-features = "nix-command flakes";
      flake-registry = "";
      nix-path = config.nix.nixPath;
    };
    channel.enable = false;
    registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
    nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
  };

  boot = {
    loader = {
      efi = {
        canTouchEfiVariables = true;
      };
      systemd-boot = {
        enable = true;
        windows = {
          "11-pro" = {
            title = "Windows 11 Pro";
            efiDeviceHandle = "HD0b";
          };
        };
      };
    };
  };

  networking = {
    hostName = "nixos";
    hostId = "7b8c3093";
  };

  users = {
    users = {
      ignis = {
        hashedPasswordFile = config.sops.secrets.user-password.path;
        isNormalUser = true;
        extraGroups = ["wheel"];
      };
    };
  };

  time.timeZone = "Europe/Belgrade";

  security.rtkit.enable = true;

  sops.secrets.user-password = {};

  documentation.man.generateCaches = false;

  system.stateVersion = "25.05";
}
