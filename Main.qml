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

    BasicCalcColumnLayout {

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
