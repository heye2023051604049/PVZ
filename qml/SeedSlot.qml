// SeedSlot.qml
import QtQuick

Item {
    id: seedSlot

    width: 25
    height: parent.height

    property string plantName: ""
    property int plantCost: 0
    property string plantImage: ""
    property bool available: true
    property bool selected: false
    property string shadowImage:""
    property Component plantComponent

    signal clicked()

    Rectangle {
        anchors.fill: parent
        color: selected ? "#a0a0ff" : (available ? "#f0f0f0" : "#cccccc")
        border.color: "#000000"
        border.width: 1
        radius: 2

        Column {
            anchors.centerIn: parent
            spacing: 5

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                source: plantImage
                width: 20
                height: 30
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: plantCost
                font.pixelSize: 8
                color: available ? "black" : "red"
            }

        }
    }

    TapHandler {
        onTapped: {
            seedSlot.clicked()
        }
    }
}
