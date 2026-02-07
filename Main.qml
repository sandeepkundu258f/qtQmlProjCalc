import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

Window {
    width: 355
    height: 510
    visible: true
    title: "Calulator"

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 10
        spacing: 10
        //padding: 10

        // The Calculator Display
        Rectangle {
            id: displayRect
            Layout.fillWidth: true
            Layout.preferredHeight: 60
            color: "#eeeeee"
            border.color: "black"

            Text {
                anchors.right: parent.right
                anchors.rightMargin: 10
                anchors.verticalCenter: parent.verticalCenter
                text: "0"
                font.pixelSize: 32
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

            Button { text: "AC"; Layout.fillHeight: true; Layout.fillWidth: true }
            Button { text: "%"; Layout.fillHeight: true; Layout.fillWidth: true }
            Button { text: "Back"; Layout.fillHeight: true; Layout.fillWidth: true }
            Button { text: "/"; Layout.fillHeight: true; Layout.fillWidth: true }

            Button { text: "7"; Layout.fillHeight: true; Layout.fillWidth: true }
            Button { text: "8"; Layout.fillHeight: true; Layout.fillWidth: true }
            Button { text: "9"; Layout.fillHeight: true; Layout.fillWidth: true }
            Button { text: "X"; Layout.fillHeight: true; Layout.fillWidth: true }

            Button { text: "4"; Layout.fillHeight: true; Layout.fillWidth: true }
            Button { text: "5"; Layout.fillHeight: true; Layout.fillWidth: true }
            Button { text: "6"; Layout.fillHeight: true; Layout.fillWidth: true }
            Button { text: "-"; Layout.fillHeight: true; Layout.fillWidth: true }

            Button { text: "1"; Layout.fillHeight: true; Layout.fillWidth: true }
            Button { text: "2"; Layout.fillHeight: true; Layout.fillWidth: true }
            Button { text: "3"; Layout.fillHeight: true; Layout.fillWidth: true }
            Button { text: "+"; Layout.fillHeight: true; Layout.fillWidth: true }

            Button { text: "0"; Layout.fillHeight: true; Layout.fillWidth: true }
            Button { text: "."; Layout.fillHeight: true; Layout.fillWidth: true }
            Button { text: "="; Layout.fillHeight: true; Layout.fillWidth: true; Layout.columnSpan: 2 }

        }
    }
}
