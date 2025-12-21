{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    quickshell
  ];
  hjem.users.ignis = {
    xdg.config.files = {
      "quickshell/shell.qml".text = ''
        import Quickshell

        Scope {
          Bar {}
        }
      '';
      "quickshell/Bar.qml".text = ''
        import Quickshell
        import Quickshell.Wayland

        Scope {
          Variants {
            model: Quickshell.screens

            PanelWindow {
              required property var modelData
              screen: modelData

              anchors {
                top: true
                left: true
                right: true
              }

              implicitHeight: 30

              color: "#23262d"

              ClockWidget {
                anchor.centerIn: parent
              }
            }
          }
        }
      '';
      "quickshell/Time.qml".text = ''
        pragma Singleton

        import Quickshell
        import QtQuick

        Singleton {
          id: root
          readonly property string time: {
            Qt.formatDateTime(clock.date, "ddd MMM d hh:mm:ss AP t yyyy")
          }

          SystemClock {
            id: clock
            precision: SystemClock.Seconds
          }
        }
      '';
      "quickshell/ClockWidget.qml".text = ''
        import QtQuick

        Text {
          text: Time.clock
        }
      '';
    };
  };
}
