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
        if (value === "" || value === "-") return value;

        let locale = Qt.locale();
        let parts = value.split(/([\+\-\u00d7\u00f7])/);

        return parts.map((part, index) => {
            if (part === "" || part === undefined) return "";

            //Handle Operators
            if (["+", "\u00d7", "\u00f7"].includes(part) || (part === "-" && index > 0)) {
                return part;
            }
            if (part === "-" && index === 0) return "-";

            // Handle the number logic
            // Split the number into Integer and Decimal parts
            let subParts = part.split(".");
            let integerPart = subParts[0];
            let decimalPart = subParts.length > 1 ? subParts[1] : null;

            // Format only the integer part with commas
            let num = parseFloat(integerPart);
            if (isNaN(num)) return part;

            // Use toLocaleString only for the whole number part
            let formattedInt = num.toLocaleString(locale, 'f', 0);

            // Stitch it back together
            if (decimalPart !== null) {
                return formattedInt + "." + decimalPart;
            }
            return formattedInt;
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
