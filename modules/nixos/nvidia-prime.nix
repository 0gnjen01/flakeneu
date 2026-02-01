{
  config,
  lib,
  ...
}: {
  options.nvidia-prime = {
    enable = lib.mkEnableOption "enables nvidia-prime";
  };
  config = lib.mkIf config.nvidia-prime.enable {
    hardware.nvidia.prime = {
      sync.enable = true;

      nvidiaBusId = "PCI:1:0:0";

      intelBusId = "PCI:0:2:0";
    };
  };
}
