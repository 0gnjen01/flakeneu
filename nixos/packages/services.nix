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
  };
  services.flatpak.enable = true;
  systemd.services.flatpak-repo = {
    wantedBy = ["multi-user.target"];
    path = [pkgs.flatpak];
    script = ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
      flatpak install flathub org.vinegarhq.Sober
    '';
  };
}
