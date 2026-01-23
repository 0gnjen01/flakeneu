{pkgs, ...}: {
  services = {
    displayManager.autoLogin = {
      enable = true;
      user = "ignis";
    };
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
    pipewire = {
      enable = true;
      audio.enable = true;
      wireplumber.enable = true;
    };
    openssh = {
      enable = true;
    };
  };
  services.flatpak.enable = true;
  system.userActivationScripts = {
    flatpak = {
      text = ''
        ${pkgs.flatpak}/bin/flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
        ${pkgs.flatpak}/bin/flatpak install flathub org.vinegarhq.Sober
      '';
    };
  };
}
