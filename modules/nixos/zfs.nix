{
  config,
  lib,
  pkgs,
  ...
}: let
  zfsCompatibleKernelPackages =
    lib.filterAttrs (
      name: kernelPackages:
        (builtins.match "linux_[0-9]+_[0-9]+" name)
        != null
        && (builtins.tryEval kernelPackages).success
        && (!kernelPackages.${config.boot.zfs.package.kernelModuleAttribute}.meta.broken)
    )
    pkgs.linuxKernel.packages;
  latestKernelPackage = lib.last (
    lib.sort (a: b: (lib.versionOlder a.kernel.version b.kernel.version)) (
      builtins.attrValues zfsCompatibleKernelPackages
    )
  );
in {
  options.zfs = {
    enable = lib.mkEnableOption "enables zfs";
  };
  config = lib.mkIf config.zfs.enable {
    boot = {
      kernelPackages = latestKernelPackage;
      supportedFilesystems = ["zfs"];
      zfs = {
        forceImportRoot = true;
        package = pkgs.zfs_unstable;
      };
    };

    services = {
      zfs = {
        trim.enable = true;
        autoSnapshot.enable = true;
      };
      sanoid = {
        enable = true;
        templates."template" = {
          hourly = 8;
        };
        datasets = {
          "zpool/root".useTemplate = ["template"];
          "zpool/home".useTemplate = ["template"];
        };
      };
    };
  };
}
