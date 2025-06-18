//the integration of all the parts
import Felgo 4.0
import QtQuick
import QtQuick.Controls

GameWindow{
    id:gameWindow
    property alias gametitle: _gametitle
    property alias gamescene: _gamescene
    //color: "white"
    //width:640
    //height:480
    title:qsTr("PlantsVSZombies,你们知道吗，什么，不会吧，真的吗")
    visible:true

    state:  "menu"

    states: [
        State {
            name: "menu"
            PropertyChanges {
                target: gametitle;opacity:1


            }
        },
        State {
            name: "game"
            PropertyChanges {
                target: gamescene;opacity:1




            }
        }
    ]

    GameTitle{

        id:_gametitle;opacity: 0
        onStartpressed: gameWindow.state ="game"
    }

    GameScene{
        id:_gamescene;opacity: 0

        Zombie{id:zb}
        Peashooter{id:ps}
        PhysicsWorld{
        debugDrawVisible: true
        }
    }


}
