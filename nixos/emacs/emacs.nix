{
  pkgs,
  inputs,
  ...
}: {
  nixpkgs.overlays = [inputs.nix-doom-emacs-unstraightened.overlays.default];

  environment.systemPackages = with pkgs; [
    (emacsWithDoom {
      doomDir = ./doom;
      doomLocalDir = "~/.local/share/doom";
      emacs = emacs-pgtk;
    })
    ripgrep
    alejandra
  ];
  fonts.packages = with pkgs; [
    nerd-fonts._0xproto
  ];
}
