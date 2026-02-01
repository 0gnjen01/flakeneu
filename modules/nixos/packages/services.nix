{
  config,
  lib,
  pkgs,
  ...
}: {
  options.services = {
    enable = lib.mkEnableOption "enables services";
  };

  config = lib.mkIf config.services.enable {
    services = {
      pipewire = {
        enable = true;
        audio.enable = true;
        wireplumber.enable = true;
      };
      openssh = {
        enable = true;
      };
      auto-cpufreq = {
        enable = lib.mkDefault false;
        settings = {
          battery = {
            governor = "powersave";
            turbo = "never";
          };
          charger = {
            governor = "performance";
            turbo = "auto";
          };
        };
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
  };
}
