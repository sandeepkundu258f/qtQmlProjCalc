import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Button {
    id: operationButton

    Layout.fillWidth: true
    Layout.fillHeight: true
    //font.bold: true
    font.weight: Font.Normal
    font.pixelSize: 18
    contentItem: Text {
        text: parent.text
        font: parent.font
        color: "black"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
    background: Rectangle {

        color: operationButton.pressed ? "#aaaaaa" : (operationButton.hovered ? "#eeeeee" : "white")

        implicitWidth: 80  // Suggests a size, but doesn't force it
        implicitHeight: 30

        radius: 10
        border.color: "#b0b6bf"
        border.width: 1
    }
}
