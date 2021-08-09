import QtQuick 2.4
import QtQuick.Controls.Material 2.12
import QtQuick.Controls 2.12

SearchBoxForm {
    mouse.onEntered:
    {
        color = "#FFe5e5e5"
        console.log("pointer entered in search")
        placeHolder.color = "#adabb0"

    }
    searchInputTextBox.onTextChanged:
    {
        if (searchInputTextBox.text != "")
            placeHolder.visible = false
        else
            placeHolder.visible = true
    }
    mouse.onExited:
    {
        color = "#66e5e5e5"
        placeHolder.color = "#dfdfdf"
        console.log("pointer exited in search")
    }
}
