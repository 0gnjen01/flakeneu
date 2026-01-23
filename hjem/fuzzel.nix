{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    nerd-fonts.dejavu-sans-mono
  ];

  hjem.users.ignis = {
    rum.programs.fuzzel = {
      enable = true;
      settings = {
        main = {
          font = "DejaVu Sans Mono:style=Book:size=13";
          layer = "overlay";
          terminal = "foot";
          icons-enabled = false;
          prompt = "";
          inner-pad = 5;
          vertical-pad = 20;
          horizontal-pad = 15;
        };
        border = {
          width = 2;
          radius = 0;
        };
        colors = {
          background = "23262dFF";
          border = "c5c9c7FF";
          text = "c5c9c7FF";
          match = "8a9a7bFF";
          selection = "43464eFF";
          selection-text = "c5c9c7FF";
          selection-match = "8ba4b0FF";
        };
      };
    };
  };
}
