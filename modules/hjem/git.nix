{
  config,
  lib,
  ...
}: {
  options.git = {
    enable = lib.mkEnableOption "enables git";
  };
  config = lib.mkIf config.git.enable {
    hjem.users.ignis = {
      rum.programs.git = {
        enable = true;
        settings = {
          user = {
            name = "0gnjen01";
            email = "ognjenk0l3@gmail.com";
          };
          init.defaultBranch = "master";
          gpg.format = "ssh";
          user.signingkey = "~/.ssh/id_ed25519.pub";
        };
      };
    };
  };
}
