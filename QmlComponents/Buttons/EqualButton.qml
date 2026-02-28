import QtQuick
import QtQuick.Layouts

OperationButton {
    id: equalBtn
    Layout.columnSpan: 2

    function getButtonColor() {
        if (pressed) {
            return equalBtnColorPress
        }
        if (hovered) {
            return equalBtnColorHover
        }
        return equalBtnColorBase
    }

    background: Rectangle {
        color: equalBtn.getButtonColor()
        implicitWidth: 80
        implicitHeight: 30

        radius: 10
        border.color: borderColorOpBtn
        border.width: 1
    }
    contentItem: Text {
        text: parent.text
        font: parent.font
        color: btnTextColorSpl
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
