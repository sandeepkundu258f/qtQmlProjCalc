import QtQuick

ButtonBase {
    id: numberButton
    font.weight: Font.Medium

    function getButtonColor() {
        if (pressed) {
            return isdarkMode ? "#212529" : "#aaaaaa"
        }
        if (hovered) {
            return isdarkMode ? "#454a4f" : "#eeeeee"
        }
        return isdarkMode ? "#31363b" : "#ffffff"
    }

    background: Rectangle {
        color:  numberButton.getButtonColor()
        radius: 10
        border.color: borderColor
        border.width: 1

        implicitWidth: 80  // Suggests a size, but doesn't force it
        implicitHeight: 30
    }
}
