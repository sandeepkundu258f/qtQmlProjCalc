import QtQuick

Rectangle {
    width: parent.width
    height: parent.height * 0.2
    color: "transparent" // Keep the parent's gray color

    Text {
        anchors.fill: parent
        anchors.rightMargin: 10
        anchors.bottomMargin: 10
        text: calcObj.partialText
        font.pixelSize: 12
        color: "#666666" // Fainter color for the small text
        horizontalAlignment: Text.AlignRight
        verticalAlignment: Text.AlignVCenter
    }
}
