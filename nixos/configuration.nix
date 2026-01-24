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
    ./zfs.nix
    ./thunar.nix
    ./nvf/nvf.nix
    ./nvf/snacks.nix
    ./nvidia.nix
    ./packages/services.nix
    ./packages/programs.nix
    ./packages/packages.nix
    ./selfhost/cloudflare-dydns.nix
    ./selfhost/nginx.nix
    ./selfhost/microbin.nix
    ../hjem/hjem.nix
    ../hjem/niri.nix
    ../hjem/mako.nix
    ../hjem/foot.nix
    ../hjem/fuzzel.nix
    ../hjem/fish.nix
    ../hjem/firefox.nix
    ../hjem/mpv.nix
    ../hjem/git.nix
    ../secrets/sops.nix
  ];

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
        extraGroups = ["wheel" "networkmanager"];
      };
    };
  };

  time.timeZone = "Europe/Belgrade";

  security.rtkit.enable = true;

  sops.secrets.user-password = {};

  documentation.man.generateCaches = false;

  system.stateVersion = "25.05";
}
