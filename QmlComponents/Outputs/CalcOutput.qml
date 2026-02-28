import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Rectangle {
    width: parent.width
    height: parent.height * 0.8
    color: "transparent"

    Text {
        anchors.fill: parent
        anchors.rightMargin: 10
        text: calcObj.displayText
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: 32
        fontSizeMode: Text.Fit
        minimumPixelSize: 14
        color: txtMain
    }
}
