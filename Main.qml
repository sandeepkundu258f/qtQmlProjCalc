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

        // 1. Move focus and keys here
        focus: true

        // 2. Force focus when the app starts
        Component.onCompleted: forceActiveFocus()

        Keys.onPressed: (event) => {
                            if (event.key >= Qt.Key_0 && event.key <= Qt.Key_9) {
                                calcObj.onButtonPressed(event.text);
                            }
                            else if (event.key === Qt.Key_Plus)      calcObj.onButtonPressed("+");
                            else if (event.key === Qt.Key_Minus)     calcObj.onButtonPressed("-");
                            else if (event.key === Qt.Key_Asterisk)  calcObj.onButtonPressed("\u00d7");
                            else if (event.key === Qt.Key_Slash)     calcObj.onButtonPressed("\u00f7");
                            else if (event.key === Qt.Key_Enter || event.key === Qt.Key_Return) {
                                calcObj.onButtonPressed("=");
                            }
                            else if (event.key === Qt.Key_Backspace) {
                                calcObj.onButtonPressed("\u232b"); // Match your BackButton unicode!
                            }
                            else if (event.key === Qt.Key_Escape) {
                                calcObj.onButtonPressed("AC");
                            }
                            else if (event.key === Qt.Key_Period) {
                                calcObj.onButtonPressed(".");
                            }
                        }

        // The Calculator Display
        Rectangle {
            id: displayRectResult
            Layout.fillWidth: true
            Layout.preferredHeight: 100 // Total height for both parts
            color: "#eeeeee"
            border.color: "black"
            radius: 10
            clip: true // Prevents text from bleeding outside the rounded corners

            Column {
                anchors.fill: parent

                // Output
                CalcOutput{}

                // Partial Output
                CalcPartialOutput{}
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
