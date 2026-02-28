import QtQuick
import QtQuick.Layouts

OperationButton {
    id: equalBtn
    Layout.columnSpan: 2

    function getButtonColor() {
        if (pressed) {
            return isdarkMode ? "#1e3d1a" : "#054017"
        }
        if (hovered) {
            return isdarkMode ? "#3a7532" : "#0a7d2d"
        }
        return isdarkMode ? "#2d5a27" : "#075920"
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
