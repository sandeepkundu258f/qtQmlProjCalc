import QtQuick

OperationButton {
    id: backBtn

    readonly property color finalColor: backBtn.pressed
        ? (isdarkMode ? "#5e191d" : "#82232c")
        : (backBtn.hovered
            ? (isdarkMode ? "#a5333a" : "#c43543")
            : (isdarkMode ? "#8b2b30" : "#a62d39"))

    background: Rectangle {
        color: finalColor
        implicitWidth: 80
        implicitHeight: 30

        radius: 10
        border.color: borderColorOpBtn
        border.width: 1
    }
    contentItem: Text {
        text: parent.text
        font: parent.font
        color: btnTextColorSpl
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
    }
}
