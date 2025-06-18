//the integration of all the parts
import Felgo 4.0
import QtQuick
import QtQuick.Controls

GameWindow{
    id:gameWindow

    property alias gameTitle: _gameTitle
    property alias gameScene: _gameScene

    //color: "white"
    //width:640
    //height:480
    title:qsTr("PlantsVSZombies,你们知道吗，什么，不会吧，真的吗")
    visible:true


//wenrenqiang
    // state:"title"

    // GameTitle{
    //     id:_gameTitle
    //     opacity: 0
    //     onBeginTapped: gameWindow.state = "game"
    // }
    // GameScene{
    //     id:_gameScene
    //     opacity: 0
    //     Image{
    //         //Zombie{id:bb}
    //     }
    // }


//activeScene: menuScene

//     states:[
//         State{
//             name:"title"
//             PropertyChanges {target:gameTitle;opacity:1}

//         },
//         State{
//             name:"menu"
//             PropertyChanges{target:menuScene;opacity:1}
//         },

//         State{
//             name:"game"
//             PropertyChanges{target:gameScene;opacity:1}
//         }
//     ]
// =======
    state:  "menu"
    states: [
        State {
            name: "menu"
            PropertyChanges {
                target: gameTitle;opacity:1


            }
        },
        State {
            name: "game"
            PropertyChanges {
                target: gameScene;opacity:1




            }
        }
    ]

    GameTitle{

        id:_gameTitle;opacity: 0
        onBeginTapped: gameWindow.state ="game"
    }

    GameScene{
        id:_gameScene;opacity: 0

        Zombie{id:zb}
        Peashooter{id:ps}
        PhysicsWorld{
        debugDrawVisible: true
        }
    }



}
