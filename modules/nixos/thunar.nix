{pkgs, ...}: {
  programs.thunar = {
    enable = true;
    plugins = with pkgs; [
      thunar-volman
      thunar-archive-plugin
      thunar-media-tags-plugin
    ];
  };
  services = {
    gvfs.enable = true;
    tumbler.enable = true;
  };
  environment.systemPackages = [
    pkgs.ffmpegthumbnailer
    pkgs.bign-handheld-thumbnailer
  ];
}
