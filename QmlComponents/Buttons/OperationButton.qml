import QtQuick

ButtonBase {
    id: operationButton
    font.weight: Font.Normal

    readonly property color finalColor: operationButton.pressed
        ? (isdarkMode ? "#2d3237" : "#aaaaaa")
        : (operationButton.hovered
            ? (isdarkMode ? "#565f67" : "#eeeeee")
            : (isdarkMode ? "#3d444b" : "#ffffff"))

    background: Rectangle {
        color: finalColor
        radius: 10
        border.color: borderColorOpBtn
        border.width: 1

        implicitWidth: 80  // Suggests a size, but doesn't force it
        implicitHeight: 30
    }
}
