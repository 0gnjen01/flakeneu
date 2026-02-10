{
  config,
  lib,
  pkgs,
  ...
}: {
  options.wlr-which-key = {
    enable = lib.mkEnableOption "enables wlr-which-key";
  };
  config = lib.mkIf config.wlr-which-key.enable {
    fonts.packages = with pkgs; [
      nerd-fonts.dejavu-sans-mono
    ];

    environment.systemPackages = with pkgs; [
      wlr-which-key
    ];
    hjem.users.ignis = {
      xdg.config.files."wlr-which-key/config.yaml".text = ''
        font:  Dejavu Sans Mono:style=Book:size=12
        background: "#23262d"
        color: "#c5c9c7"
        border: "#c5c9c7"
        separator: " ➜ "
        border_width: 2
        corner_r: 0
        padding: 15 # Defaults to corner_r
        rows_per_column: 5 # No limit by default
        column_padding: 25 # Defaults to padding

        # Anchor and margin
        anchor: center # One of center, left, right, top, bottom, bottom-left, top-left, etc.
        # Only relevant when anchor is not center
        margin_right: 0
        margin_bottom: 0
        margin_left: 0
        margin_top: 0

        namespace: "wlr_which_key"

        inhibit_compositor_keyboard_shortcuts: true

        auto_kbd_layout: true

        menu:
          - key: "p"
            desc: Power
            submenu:
              - key: "s"
                desc: Sleep
                cmd: systemctl suspend
              - key: "r"
                desc: Reboot
                cmd: reboot
              - key: "o"
                desc: Off
                cmd: poweroff
      '';
    };
  };
}
