import QtQuick

OperationButton {
    id: backBtn

    function getButtonColor() {
        if (pressed) {
            return isdarkMode ? "#5e191d" : "#82232c"
        }
        if (hovered) {
            return isdarkMode ? "#a5333a" : "#c43543"
        }
        return isdarkMode ? "#8b2b30" : "#a62d39"
    }

    background: Rectangle {
        color: backBtn.getButtonColor()
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
