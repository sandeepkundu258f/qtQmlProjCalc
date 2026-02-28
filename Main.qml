import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import "./QmlComponents/Buttons"
import "./QmlComponents/Layouts"
import "./QmlComponents/Outputs"

Window {
    id: root
    width: 355
    height: 450
    visible: true
    title: "Calculator"

    // Set the floor
    minimumWidth: 355
    minimumHeight: 450

    // dark theme logic
    property bool isdarkMode: false
    SystemPalette {
        id: sysPalette
        colorGroup: SystemPalette.Active
    }
    Timer {
        interval: 1000 // time in 'ms'
        running: true
        repeat: true
        triggeredOnStart: true // Check immediately when app opens

        onTriggered: {
            //Access colors through the SystemPalette object
            let bgColor = sysPalette.window
            let textColor = sysPalette.windowText

            // If text is light and background is dark, it's Dark Mode
            let isDark = textColor.hslLightness > bgColor.hslLightness

            if (root.isdarkMode !== isDark) {
                root.isdarkMode = isDark
                console.log("Theme detected. DarkMode: " + isDark)
            }
        }
    }

    readonly property color bgColor: isdarkMode ? "#232629" : "#ffffff"
    readonly property color displayBox: isdarkMode ? "#1b1e20" : "#eeeeee"
    readonly property color borderColor: isdarkMode ? "#4d4d4d" : "black"
    readonly property color borderColorOpBtn: isdarkMode ? "#4d4d4d" : "#b0b6bf"
    readonly property color txtMain: isdarkMode ? "#eff0f1" : "#000000"
    readonly property color txtSecondary: isdarkMode ? "#bdc3c7" : "#666666"
    readonly property color btnTextColor: isdarkMode ? "#eff0f1" : "black"
    readonly property color btnTextColorSpl: isdarkMode ? "#eff0f1" : "white"

    color: bgColor

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
