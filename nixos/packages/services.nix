{pkgs, ...}: {
  services = {
    displayManager.ly.enable = true;
    pipewire = {
      enable = true;
      audio.enable = true;
      wireplumber.enable = true;
    };
    # Thunar
    gvfs.enable = true;
    tumbler.enable = true;
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
