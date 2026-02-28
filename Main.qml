import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "./QmlComponents/Buttons"
import "./QmlComponents/Layouts"
import "./QmlComponents/Outputs"

WindowBaseLayout {
    id: root
    width: 355
    height: 450
    visible: true
    title: "Calculator"

    // Set the floor
    minimumWidth: 355
    minimumHeight: 450


    function formatDisplay(value) {
        if (value === "" || value === "-") return value; // Don't format a lone minus

        let locale = Qt.locale();

        // 1. Improved Regex: Matches operators (+, ×, ÷) and
        // the minus sign (-) only when it acts as an operator (between numbers).
        // This leaves leading negative signs attached to their numbers.
        let parts = value.split(/([+\u00d7\u00f7]|(?<=\d)-)/);

        return parts.map(part => {
            if (part === "" || part === undefined) return "";

            // 2. If it's a standalone operator, return it with spacing
            if (["+", "\u00d7", "\u00f7", "-"].includes(part)) {
                return " " + part + " ";
            }

            // 3. Parse the number (handles negative signs automatically)
            let num = parseFloat(part);
            if (isNaN(num)) return part;

            // 4. Format with commas based on Locale (INR vs USA)
            return num.toLocaleString(locale, 'f', num % 1 === 0 ? 0 : 2);
        }).join("");
    }

    BasicCalcColumnLayout {

        // The Calculator Display
        Rectangle {
            id: displayRectResult
            Layout.fillWidth: true
            Layout.preferredHeight: 100 // Total height for both parts
            color: displayBox
            border.color: borderColor
            radius: 10
            clip: true // Prevents text from bleeding outside the rounded corners

            Column {
                anchors.fill: parent

                CalcOutput {}
                CalcPartialOutput {}
            }
        }

        // The Button Grid
        GridLayout {
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
