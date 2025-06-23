//Shovel.qml
import QtQuick
import QtQuick.Controls
import Felgo 4.0
Button {
     signal shovelSelected
    width:50;height: 50
    property string imageSource:"../assets/Shovel_hi_res.png"
    //signal clicked(string imageSource)
    background: Rectangle{id:rectangle;color:"transparent";border.color:"red"}
    Image {
        anchors.fill:parent
        id:shovelBank
        source: "../assets/ShovelBank.png"
        Image {
            id: shovel
            anchors.fill:parent
            source: "../assets/Shovel.png"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
    }
}
