# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{
  inputs,
  lib,
  config,
  ...
}: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ../hjem/hjem.nix
    ../hjem/niri/niri.nix
    ../hjem/foot.nix
    ../hjem/fuzzel.nix
    ../hjem/git.nix
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
    loader.limine = {
      enable = true;
    };
  };

  networking.hostName = "nixos";

  users.users = {
    ignis = {
      initialPassword = "sudonix";
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager"];
    };
  };

  networking.networkmanager.enable = true;

  time.timeZone = "Europe/Belgrade";

  system.stateVersion = "25.05";
}
