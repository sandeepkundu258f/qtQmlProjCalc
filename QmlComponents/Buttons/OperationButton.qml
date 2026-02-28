import QtQuick

ButtonBase {
    id: operationButton
    font.weight: Font.Normal

    function getButtonColor() {
        if (pressed) {
            return isdarkMode ? "#2d3237" : "#aaaaaa"
        }
        if (hovered) {
            return isdarkMode ? "#565f67" : "#eeeeee"
        }
        return isdarkMode ? "#3d444b" : "#ffffff"
    }

    background: Rectangle {
        color: operationButton.getButtonColor()
        radius: 10
        border.color: borderColorOpBtn
        border.width: 1

        implicitWidth: 80  // Suggests a size, but doesn't force it
        implicitHeight: 30
    }
}
