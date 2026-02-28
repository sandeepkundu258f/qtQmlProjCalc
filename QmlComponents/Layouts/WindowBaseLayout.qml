import QtQuick

Window {
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

            if (isdarkMode !== isDark) {
                isdarkMode = isDark
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

    readonly property color backBtnColorPress: isdarkMode ? "#5e191d" : "#82232c"
    readonly property color backBtnColorHover: isdarkMode ? "#a5333a" : "#c43543"
    readonly property color backBtnColorBase: isdarkMode ? "#8b2b30" : "#a62d39"

    readonly property color equalBtnColorPress: isdarkMode ? "#1e3d1a" : "#054017"
    readonly property color equalBtnColorHover: isdarkMode ? "#3a7532" : "#0a7d2d"
    readonly property color equalBtnColorBase: isdarkMode ? "#2d5a27" : "#075920"

    readonly property color numberBtnColorPress: isdarkMode ? "#212529" : "#aaaaaa"
    readonly property color numberBtnColorHover: isdarkMode ? "#454a4f" : "#eeeeee"
    readonly property color numberBtnColorBase: isdarkMode ? "#31363b" : "#ffffff"

    readonly property color opBtnColorPress: isdarkMode ? "#2d3237" : "#aaaaaa"
    readonly property color opBtnColorHover: isdarkMode ? "#565f67" : "#eeeeee"
    readonly property color opBtnColorBase: isdarkMode ? "#3d444b" : "#ffffff"

    color: bgColor
}
