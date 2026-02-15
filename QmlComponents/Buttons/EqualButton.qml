import QtQuick
import QtQuick.Layouts

OperationButton {
    id: equalBtn
    Layout.columnSpan: 2
    background: Rectangle {
        color: equalBtn.pressed ? "#054017" : (equalBtn.hovered ? "#0a7d2d" : "#075920")

        implicitWidth: 80
        implicitHeight: 30

        radius: 10
        border.color: "#b0b6bf"
        border.width: 1
    }
    contentItem: Text {
        text: parent.text
        font: parent.font
        color: "white"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
