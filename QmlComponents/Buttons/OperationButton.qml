import QtQuick

ButtonBase {
    id: operationButton
    font.weight: Font.Normal

    function getButtonColor() {
        if (pressed) {
            return opBtnColorPress
        }
        if (hovered) {
            return opBtnColorHover
        }
        return opBtnColorBase
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
