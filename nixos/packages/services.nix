{pkgs, ...}: {
  services = {
    displayManager.ly = {
      enable = true;
      settings = {
        bigclock = "en";
      };
    };
    pipewire = {
      enable = true;
      audio.enable = true;
      wireplumber.enable = true;
    };
    acpid.enable = true;
    jellyfin = {
      enable = true;
      openFirewall = true;
      user = "ignis";
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
