{
  config,
  lib,
  ...
}: {
  options.mpv = {
    enable = lib.mkEnableOption "enables mpv";
  };
  config = lib.mkIf config.git.enable {
    hjem.users.ignis = {
      rum.programs.mpv = {
        enable = true;
      };
    };
  };
}
