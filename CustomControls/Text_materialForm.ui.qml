import QtQuick 2.4
import QtQuick.Controls.Material 2.12

Text {
    id: root
    text: qsTr("text")
    property alias mouse: mouse
    property alias hoverColor: mouse.hoverColor
    property color mainColor: null

    color: Material.foreground
    MouseArea {
        id: mouse
        property color hoverColor: color
        anchors.fill: parent
        cursorShape: Qt.PointingHandCursor
        hoverEnabled: true
    }
}
