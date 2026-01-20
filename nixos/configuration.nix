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
    ./nvf/nvf.nix
    ./nvf/snacks.nix
    ./nvidia.nix
    ./stylix.nix
    ./packages/services.nix
    ./packages/programs.nix
    ./packages/packages.nix
    ./selfhost/minecraft.nix
    ./selfhost/microbin.nix
    ./selfhost/cloudflare-dydns.nix
    ./selfhost/nextcloud.nix
    ./selfhost/nginx.nix
    ../hjem/hjem.nix
    ../hjem/niri.nix
    ../hjem/mako.nix
    ../hjem/kitty.nix
    ../hjem/fuzzel.nix
    ../hjem/fish.nix
    ../hjem/firefox.nix
    ../hjem/mpv.nix
    ../hjem/git.nix
    ../hjem/zathura.nix
    ../secrets/sops.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
    };
  };

  documentation.man.generateCaches = false;

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
      limine = {
        enable = true;
        efiSupport = true;
        extraEntries = ''
          /Windows
            protocol: efi
            path: boot():/EFI/Microsoft/Boot/bootmgfw.efi
        '';
        style = {
          wallpapers = [pkgs.nixos-artwork.wallpapers.nineish-dark-gray.gnomeFilePath];
        };
      };
    };
  };

  zramSwap = {
    enable = true;
    algorithm = "zstd";
  };

  hardware = {
    opentabletdriver.enable = true;
  };

  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  users.users = {
    ignis = {
      isNormalUser = true;
      extraGroups = ["wheel" "networkmanager"];
    };
  };

  time.timeZone = "Europe/Belgrade";

  security.rtkit.enable = true;

  system.stateVersion = "25.05";
}
