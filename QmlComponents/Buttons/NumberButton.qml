import QtQuick

ButtonBase {
    id: numberButton
    font.weight: Font.Medium

    function getButtonColor() {
        if (pressed) {
            return numberBtnColorPress
        }
        if (hovered) {
            return numberBtnColorHover
        }
        return numberBtnColorBase
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
