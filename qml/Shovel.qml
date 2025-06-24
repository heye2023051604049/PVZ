//Shovel.qml
import QtQuick
import QtQuick.Controls
import Felgo 4.0
Button {
    property bool deleteModel:false
    width:70;height: 60
    background: Rectangle{id:rectangle;color:"transparent";border.color:"transparent"}
    Row{
        Image {
            id:_shovelBank
            width:40;height: 40
            source: "../assets/ShovelBank.png"
            Image {
                id: _shovelImage
                anchors.fill:parent
                source: "../assets/Shovel.png"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
        }
        Image {
            width:30;height: 30
            id: frame
            source:deleteModel? "../assets/options_checkbox1.png" : "../assets/options_checkbox0.png"
        }
    }
    // TapHandler{
    //     onTapped: {
    //         if(deleteModel){
    //             deleteModel = false
    //             console.log("deleteDodel :",deleteModel)
    //         } else {
    //             deleteModel = true
    //             console.log("deleteModel :",deleteModel)
    //         }
    //     }
    // }
}
