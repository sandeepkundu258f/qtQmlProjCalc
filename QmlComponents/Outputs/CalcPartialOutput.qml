import QtQuick

Rectangle {
    width: parent.width
    height: parent.height * 0.2
    color: "transparent" // Keep the parent's gray color

    Text {
        anchors.fill: parent
        anchors.rightMargin: 10
        anchors.bottomMargin: 10
        //ext: calcObj.partialText
        text: formatDisplay(calcObj.partialText)
        font.pixelSize: 12
        color: txtSecondary
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
    }
}
