import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "./QmlComponents"

Window {
    width: 355
    height: 450
    visible: true
    title: "Calculator"

    // Set the floor
    minimumWidth: 355
    minimumHeight: 450

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10
        //padding: 10

        // The Calculator Display
        Rectangle {
            id: displayRect
            Layout.fillWidth: true
            Layout.preferredHeight: 80
            color: "#eeeeee"
            border.color: "black"
            radius: 10

            Text {
                anchors.fill: parent // Fill the whole gray rectangle
                anchors.rightMargin: 10

                text: calcObj.displayText
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter

                font.pixelSize: 32
                fontSizeMode: Text.Fit // Shrink text to fit the width
                minimumPixelSize: 14   // Don't shrink smaller than this
            }
        }

        // The Button Grid
        GridLayout{
            id: buttonGrid
            columns: 4
            columnSpacing: 5
            rowSpacing: 5
            Layout.fillWidth: true
            Layout.fillHeight: true

            OperationButton {text: "AC"}
            OperationButton { text: "%" }
            BackButton {text: "\u232b"} //back
            OperationButton { text: "\u00f7" } //divide

            NumberButton { text: "7" }
            NumberButton { text: "8" }
            NumberButton { text: "9" }
            OperationButton { text: "\u00d7" } //multiple

            NumberButton { text: "4" }
            NumberButton { text: "5" }
            NumberButton { text: "6" }
            OperationButton { text: "-" }

            NumberButton { text: "1" }
            NumberButton { text: "2" }
            NumberButton { text: "3" }
            OperationButton { text: "+" }

            NumberButton { text: "0" }
            NumberButton { text: "."}
            EqualButton { text: "=" }
        }
    }
}
