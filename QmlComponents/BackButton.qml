import QtQuick

OperationButton {
    id: backBtn
    background: Rectangle {
        color: backBtn.pressed ? "#82232c" : (backBtn.hovered ? "#c43543" : "#a62d39")

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
