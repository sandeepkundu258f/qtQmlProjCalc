import QtQuick
import QtQuick.Controls
import QtQuick.Layouts


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
                        else if (event.key === Qt.Key_Plus){
                            calcObj.onButtonPressed("+");
                        }
                        else if (event.key === Qt.Key_Minus){
                            calcObj.onButtonPressed("-");
                        }
                        else if (event.key === Qt.Key_Asterisk){
                            calcObj.onButtonPressed("\u00d7");
                        }
                        else if (event.key === Qt.Key_Slash){
                            calcObj.onButtonPressed("\u00f7");
                        }
                        else if (event.key === Qt.Key_Enter || event.key === Qt.Key_Return || event.key === Qt.Key_Equal) {
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
}
