{
  config,
  lib,
  pkgs,
  ...
}: {
  options.yambar = {
    enable = lib.mkEnableOption "enables yambar";
  };

  config = lib.mkIf config.yambar.enable {
    environment.systemPackages = with pkgs; [
      yambar
    ];
    hjem.users.ignis = {
      xdg.config.files."yambar/config.yml".text = ''
        black: &black 222630FF
        white: &white E5E9F0FF
        blue:  &blue  5E81ACFF
        red:   &red   B74E58FF
        green: &green B1C89DFF

        bar:
          location: top
          height: 60
          margin: 10
          spacing: 8
          font: "DejaVu Sans Mono:style=SemiBold:pixelsize=36" # old = 32
          background: *black
          foreground: *white
          left:
            - river:
                anchors:
                  river_common: &river_common {text: "{id}", margin: 20}
                content:
                  map:
                    conditions:
                      urgent: {string: {<<: *river_common, deco: {underline: {size: 8, color: *red}}}}
                      focused: {string: {<<: *river_common, deco: {underline: {size: 8, color: *blue}}}}
                      occupied: {string: {<<: *river_common}}
            - foreign-toplevel:
                content:
                  map:
                    conditions:
                      ~activated: {empty: {}}
                      activated: {string: {text: "{title}"}}
          right:
            - pipewire:
                anchors:
                  pipewire_common: &pipewire_common {text: "{cubic_volume}%", margin: 8}
                content:
                  list:
                    items:
                      - map:
                          conditions:
                            muted: {string: {<<: *pipewire_common, foreground: *red}}
                            ~muted: {string: {<<: *pipewire_common}}
            - battery:
                name: "BAT1"
                anchors:
                  battery_indicator: &battery_indicator {text: "━"}
                  battery_filled: &battery_filled {string: {text: "━", foreground: *green}}
                content:
                  progress-bar:
                    tag: capacity
                    length: 6
                    start: {empty: {}}
                    end: {empty: {}}
                    fill: {string: {<<: *battery_indicator, foreground: *green}}
                    empty: {string: {<<: *battery_indicator}}
                    indicator: {string: {<<: *battery_indicator, foreground: *green}}
            - clock:
                content: {string: {text: "{time}"}}
      '';
    };
  };
}
