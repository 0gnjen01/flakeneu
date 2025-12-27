{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    quickshell
  ];
  hjem.users.ignis = {
    xdg.config.files = {
      "quickshell/shell.qml".text = ''
        import Quickshell
        import Quickshell.Wayland
        import Quickshell.Io
        import QtQuick
        import QtQuick.Layouts

        PanelWindow {
            id: root

            property color colBg: "#23262d"
            property color colFg: "#c5c9c7"
            property string fontFamily: "0xProto Nerd Font Mono"
            property int fontSize: 14

            anchors.top: true
            anchors.left: true
            anchors.right: true
            implicitHeight: 30
            color: root.colBg

            RowLayout {
                anchors.fill: parent
                anchors.margins: 8

                Text {
                    id: clock
                    anchors.centerIn: parent
                    text: Qt.formatDateTime(new Date(), "HH:mm")
                    color: root.colFg
                    font { family: root.fontFamily; pixelSize: root.fontSize; bold: true }
                    Timer {
                        interval: 1000
                        running: true
                        repeat: true
                        onTriggered: clock.text = Qt.formatDateTime(new Date(), "HH:mm")
                    }
                }
            }
        }
      '';
    };
  };
}
