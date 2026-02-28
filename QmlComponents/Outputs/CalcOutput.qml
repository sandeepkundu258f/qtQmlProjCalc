import QtQuick

Rectangle {
    width: parent.width
    height: parent.height * 0.8
    color: "transparent"

    Text {
        anchors.fill: parent
        anchors.rightMargin: 10
        text: formatDisplay(calcObj.displayText)
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
        font.pixelSize: text.length > 10 ? 30 : 32
        fontSizeMode: Text.Fit
        minimumPixelSize: 14
        color: txtMain
    }
}
