import QtQuick 2.4
import QtQuick.Controls.Material 2.12
Text_materialForm {

    Component.onCompleted:
    {
        mainColor = color
    }
    mouse.onEntered:
    {
        color = hoverColor
    }
    mouse.onExited:
    {
        color = mainColor
    }
}
