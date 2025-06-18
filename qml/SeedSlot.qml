// SeedSlot.qml
import QtQuick

Item {
    id: seedSlot

    width: 80
    height: parent.height

    property string plantName: ""
    property int plantCost: 0
    property string plantImage: ""
    property bool available: true
    property bool selected: false

    signal clicked()

    Rectangle {
        anchors.fill: parent
        color: selected ? "#a0a0ff" : (available ? "#f0f0f0" : "#cccccc")
        border.color: "#000000"
        border.width: 2
        radius: 5

        Column {
            anchors.centerIn: parent
            spacing: 5

            Image {
                anchors.horizontalCenter: parent.horizontalCenter
                source: plantImage
                width: 50
                height: 50
            }

            Text {
                anchors.horizontalCenter: parent.horizontalCenter
                text: plantCost
                font.pixelSize: 16
                color: available ? "black" : "red"
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            seedSlot.clicked()
        }
    }
}
