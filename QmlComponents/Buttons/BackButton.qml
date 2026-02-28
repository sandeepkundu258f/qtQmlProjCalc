import QtQuick

OperationButton {
    id: backBtn

    function getButtonColor() {
        if (pressed) {
            return backBtnColorPress
        }
        if (hovered) {
            return backBtnColorHover
        }
        return backBtnColorBase
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
