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

  services = {
    greetd = {
      enable = true;
      settings = rec {
        initial_session = {
          command = "niri-session";
          user = "ignis";
        };
        default_session = initial_session;
      };
    };
    displayManager.autoLogin = {
      enable = true;
      user = "ignis";
    };
    pipewire = {
      enable = true;
      audio.enable = true;
      wireplumber.enable = true;
    };
    flatpak.enable = true;
  };

  system.userActivationScripts = {
    flatpak = {
      text = ''
        ${pkgs.flatpak}/bin/flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
      '';
    };
  };

  programs = {
    nh = {
      enable = true;
      flake = "/home/ignis/flakeneu";
      clean = {
        enable = true;
        extraArgs = "--keep 5 --keep-since 3d";
      };
    };
    steam = {
      enable = true;
      gamescopeSession.enable = true;
      protontricks.enable = true;
    };
    thunderbird = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    vesktop
    lazygit
    fastfetch
    prismlauncher
    anki
    adwaita-icon-theme
    btop
    krita
    swayimg
    pavucontrol
    p7zip-rar
    qbittorrent
    fd
    eza
    clang
    signal-desktop-bin
    dino
    nextcloud-client
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
        extraGroups = ["wheel"];
      };
    };
  };

  zramSwap.enable = true;

  time.timeZone = "Europe/Belgrade";

  security.rtkit.enable = true;

  sops.secrets.user-password = {};

  documentation.man.generateCaches = false;

  system.stateVersion = "25.05";
}
