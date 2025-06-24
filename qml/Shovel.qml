//Shovel.qml
import QtQuick
import QtQuick.Controls
import Felgo 4.0
Button {
    width:50;height: 50
    background: Rectangle{id:rectangle;color:"transparent";border.color:"transparent"}
    Image {
        id:_shovelBank
        anchors.fill:parent
        source: "../assets/ShovelBank.png"
        Image {
            id: _shovelImage
            anchors.fill:parent
            source: "../assets/Shovel.png"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
