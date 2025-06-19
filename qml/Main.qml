//the integration of all the parts
import Felgo 4.0
import QtQuick
import QtQuick.Controls

GameWindow{
    id:gameWindow

    property alias gameTitle: _gameTitle
    property alias gameScene: _gameScene

    title:qsTr("PlantsVSZombies,你们知道吗，什么，不会吧，真的吗")
    visible:true



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

        Zombie{id:zombie}
        Peashooter{id:peashooter}
        PhysicsWorld{
        debugDrawVisible: true
        //updatesPerSecondForPhysics:60
        //gravity. y:10

        }

        EntityManager {id:entityManager; entityContainer: gameScene}

    }



}
