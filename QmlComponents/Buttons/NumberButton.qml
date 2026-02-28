import QtQuick

ButtonBase {
    id: numberButton
    font.weight: Font.Medium

    readonly property color finalColor: numberButton.pressed
        ? (isdarkMode ? "#212529" : "#aaaaaa")
        : (numberButton.hovered
            ? (isdarkMode ? "#454a4f" : "#eeeeee")
            : (isdarkMode ? "#31363b" : "#ffffff"))

    background: Rectangle {
        color:  finalColor
        radius: 10
        border.color: borderColor
        border.width: 1

        implicitWidth: 80  // Suggests a size, but doesn't force it
        implicitHeight: 30
    }
}
