import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Button {
    id: numberButton

    Layout.fillWidth: true
    Layout.fillHeight: true
    //font.bold: true
    font.weight: Font.Medium
    font.pixelSize: 18
    contentItem: Text {
        text: parent.text
        font: parent.font
        color: "black"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
    background: Rectangle {
        color: numberButton.pressed ? "#aaaaaa" : (numberButton.hovered ? "#eeeeee" : "white")
        radius: 10
        border.color: "black"
        border.width: 1

        implicitWidth: 80  // Suggests a size, but doesn't force it
        implicitHeight: 30
    }
}
