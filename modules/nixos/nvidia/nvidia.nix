{
  config,
  lib,
  ...
}: {
  options.nvidia = {
    enable = lib.mkEnableOption "enables nvidia";
  };
  config = lib.mkIf config.nvidia.enable {
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    services.xserver.videoDrivers = ["nvidia"];

    boot = {
      kernelParams = ["nvidia-drm.modeset=1"];
      blacklistedKernelModules = ["nouveau"];
    };

    hardware.nvidia = {
      modesetting.enable = true;

      powerManagement.enable = false;

      powerManagement.finegrained = false;

      open = false;

      nvidiaSettings = true;

      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
