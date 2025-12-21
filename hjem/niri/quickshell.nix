{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    quickshell
  ];
  hjem.users.ignis = {
    xdg.config.files = {
      "quickshell/shell.qml".text = ''
        // shell.qml
        import Quickshell

        Scope {
          Bar {}
        }
      '';
      "quickshell/Bar.qml".text = ''
        // Bar.qml
        import Quickshell

        Scope {
          // no more time object

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

              ClockWidget {
                anchors.centerIn: parent

                // no more time binding
              }
            }
          }
        }
      '';
      "quickshell/Time.qml".text = ''
        // Time.qml
        pragma Singleton

        import Quickshell
        import QtQuick

        Singleton {
          id: root
          // an expression can be broken across multiple lines using {}
          readonly property string time: {
            // The passed format string matches the default output of
            // the `date` command.
            Qt.formatDateTime(clock.date, "ddd MMM d hh:mm:ss AP t yyyy")
          }

          SystemClock {
            id: clock
            precision: SystemClock.Seconds
          }
        }
      '';
      "quickshell/ClockWidget.qml".text = ''
        // ClockWidget.qml
        import QtQuick

        Text {
          // we no longer need time as an input

          // directly access the time property from the Time singleton
          text: Time.time
        }
      '';
    };
  };
}
