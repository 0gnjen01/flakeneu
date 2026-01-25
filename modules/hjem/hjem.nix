{
  config,
  lib,
  inputs,
  ...
}: {
  options.hjem = {
    enable = lib.mkEnableOption "enables hjem";
  };

  config = lib.mkIf config.hjem.enable {
    hjem = {
      extraModules = [
        inputs.hjem-rum.hjemModules.default
      ];
      users.ignis = {
        user = "ignis";
        directory = "/home/ignis";
      };
      clobberByDefault = true;
    };
  };
}
