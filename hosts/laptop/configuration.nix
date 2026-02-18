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
    ../../modules/default.nix
  ];

  foot.enable = false;
  niri.enable = false;
  wlr-which-key.enable = false;
  mpv.enable = false;
  fuzzel.enable = false;
  librewolf.enable = false;

  minecraft.enable = false;
  nvidia-prime.enable = true;
  cloudflare.enable = true;
  microbin.enable = true;
  nextcloud.enable = true;
  nginx.enable = true;

  systemd.services."getty@tty1" = {
    overrideStrategy = "asDropin";
    serviceConfig.ExecStart = ["" "@${pkgs.util-linux}/sbin/agetty agetty --login-program ${config.services.getty.loginProgram} --autologin ignis --noclear --keep-baud %I 115200,38400,9600 $TERM"];
  };

  services = {
    resolved = {
      enable = true;
    };
    fail2ban = {
      enable = true;
    };
    logind.settings.Login = {
      HandleLidSwitch = "ignore";
      HandleLidSwitchExternalPower = "ignore";
      HandleLidSwitchDocked = "ignore";
    };
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "balanced";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "balanced";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 50;

        START_CHARGE_THRESH_BAT0 = 40; # 40 and below it starts to charge
        STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
      };
    };
    openssh = {
      enable = true;
    };
    thermald.enable = true;
    upower.enable = true;
  };

  programs = {
    tmux = {
      enable = true;
      keyMode = "vi";
      clock24 = true;
    };
    direnv = {
      enable = true;
      nix-direnv.enable = true;
      silent = true;
      loadInNixShell = true;
      enableFishIntegration = true;
    };
    nh = {
      enable = true;
      flake = "/home/ignis/flakeneu";
      clean = {
        enable = true;
        extraArgs = "--keep 5 --keep-since 3d";
      };
    };
  };

  powerManagement.powertop.enable = true;

  # packages
  environment.systemPackages = with pkgs; [
    lazygit
    fastfetch
    btop
    busybox
    fd
    eza
    norgolith
    cloudflared
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
      };
    };
  };

  networking = {
    hostName = "nixos";
    hostId = "7b8c3093";
    networkmanager.enable = true;
    interfaces.wlo1.wakeOnLan.enable = true;
    firewall.allowedTCPPorts = [22 3030];
  };

  users = {
    users = {
      ignis = {
        hashedPasswordFile = config.sops.secrets.user-password.path;
        isNormalUser = true;
        extraGroups = ["wheel" "networkmanager" "video"];
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
