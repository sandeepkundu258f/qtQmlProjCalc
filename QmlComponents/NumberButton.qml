import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ButtonBase {
    id: numberButton
    font.weight: Font.Medium

    background: Rectangle {
        color:  numberButton.pressed ? "#aaaaaa" : (numberButton.hovered ? "#eeeeee" : "white")
        radius: 10
        border.color: "black"
        border.width: 1

        implicitWidth: 80  // Suggests a size, but doesn't force it
        implicitHeight: 30
    }
}
