//the integration of all the parts
import Felgo 4.0
import QtQuick
import QtQuick.Controls
GameWindow{
    property alias gametitle: _gametitle
    //color: "white"
    //width:640
    //height:480
    title:qsTr("PlantsVSZombies,你们知道吗，什么，不会吧，真的吗")
    //visible:true
    GameTitle{
        id:_gametitle
    }


}
