import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Button {
    id: buttonBase

    Layout.fillWidth: true
    Layout.fillHeight: true
    font.pixelSize: 18
    contentItem: Text {
        text: parent.text
        font: parent.font
        color: "black"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
