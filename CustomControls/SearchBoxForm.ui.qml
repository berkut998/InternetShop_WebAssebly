import QtQuick 2.0
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12

Rectangle {
    id: root
    width: 120
    height: 40
    color: "#66e5e5e5"
    radius: 20
    border.color: "#00000000"
    border.width: 0
    property alias placeHolder: placeHolder
    property alias searchButton: searchButton
    property alias searchInputTextBox: searchInputTextBox
    property alias mouse: mouse
    MouseArea {
        id: mouse
        anchors.fill: parent
        cursorShape: Qt.IBeamCursor
        hoverEnabled: true
    }
    Material_RoundButton {
        id: searchButton
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        font.pointSize: 12
        rightPadding: 15
        leftPadding: 15
        anchors.topMargin: -7
        anchors.bottomMargin: -7
        anchors.leftMargin: -7
        icon.source: "qrc:/Images/baseline_search_black_24dp.png"
    }

    TextInput {
        id: searchInputTextBox
        text: ""
        anchors.left: searchButton.right
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        verticalAlignment: Text.AlignVCenter
        font.pointSize: 12
        selectionColor: "#3daee9"
        selectByMouse: true
        anchors.leftMargin: 5
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        anchors.rightMargin: 3
        clip: true
        Text {
            id: placeHolder
            color: "#dfdfdf"
            text: qsTr("Поиск")
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 12
            anchors.leftMargin: 0
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:3}
}
##^##*/

