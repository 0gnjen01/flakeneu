{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.overlays = [inputs.nix-doom-emacs-unstraightened.overlays.default];
  (pkgs.emacsWithDoom {
    doomDir = inputs.doom-config;
    doomDir = ./doom;
  })
}
