//Shovel.qml
import QtQuick
import QtQuick.Controls
import Felgo 4.0
Item {
    property alias shovelRes:_shovelRes
    property alias imageSource:_shovelRes.source
    Image {
        id:shovelBank
        source: "../assets/ShovelBank.png"
        Image {
            id: shovel
            source: "../assets/Shovel.png"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
        }
        TapHandler{
            onTapped: {
                shovelRes.visible = true
            }
        }
    }
    Image{
        id:_shovelRes
        source:"../assets/Shovel_hi_res.png"
        visible:false
        }
    }
