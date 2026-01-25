{
  config,
  lib,
  ...
}: {
  options.mpv = {
    enable = lib.mkEnableOption "enables mpv";
  };
  config = lib.mkIf config.mpv.enable {
    hjem.users.ignis = {
      rum.programs.mpv = {
        enable = true;
      };
    };
  };
}
