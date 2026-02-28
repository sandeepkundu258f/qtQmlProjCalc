import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Button {
    id: buttonBase

    onClicked: {
        calcObj.onButtonPressed(text) // 'text' is the button's text property
    }

    Layout.fillWidth: true
    Layout.fillHeight: true
    font.pixelSize: 18
    contentItem: Text {
        text: parent.text
        font: parent.font
        color: btnTextColor
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
