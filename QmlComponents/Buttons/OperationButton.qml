import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

ButtonBase {
    id: operationButton
    font.weight: Font.Normal

    background: Rectangle {
        color: operationButton.pressed ? "#aaaaaa" : (operationButton.hovered ? "#eeeeee" : "white")
        radius: 10
        border.color: "#b0b6bf"
        border.width: 1

        implicitWidth: 80  // Suggests a size, but doesn't force it
        implicitHeight: 30
    }
}
