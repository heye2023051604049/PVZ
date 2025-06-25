//the integration of all the parts
import Felgo
import QtQuick
import QtQuick.Controls

GameWindow{
    id:gameWindow

    property alias gameTitle: _gameTitle
    property alias gameScene: _gameScene
    property alias win:_win


    property alias zombie11: creatzombie1
    property alias zombie22: creatzombie2
    property alias zombie33: creatzombie3
    property alias zombie44: creatzombieCZ
    property alias zombie55: creatzombieBk
    property alias entityManager :entityManager




    title:qsTr("PlantsVSZombies,你们知道吗，什么，不会吧，真的吗")
    visible:true



    state:  "menu"
    states: [
        State {
            name: "menu"
            PropertyChanges {target: gameTitle;opacity:1}
            PropertyChanges {target: gameWindow; activeScene: gameTitle}



        },
        State {
            name: "game"
            PropertyChanges {target: gameScene;opacity:1}
            PropertyChanges {target: gameWindow; activeScene: gameScene}

        },
        State {
            name:"win"
            PropertyChanges {target: win;opacity:1}
            PropertyChanges {target: gameWindow; activeScene: win}

        }
    ]

    GameTitle{
        id:_gameTitle;opacity: 0
        onBeginTapped: {
            gameWindow.state ="game"
            gameTitle.bgm.backgroundMusic.stop()
        }

    }
    Win{
        id:_win;opacity: 0

    }

    GameScene{
        id:_gameScene;opacity:  0
        PhysicsWorld{
            debugDrawVisible: true
            updatesPerSecondForPhysics:60
        }
        EntityManager {id:entityManager;

                       entityContainer: gameScene
                      // entityTypes:[
                      //  EntityType{}



        }

        //var array = entityManager.getEntityArrayByType(zombie)



        }

        Timer{
            id:creatzombie1
            interval: 8000
            running: true
            repeat: false
            property string zombie1
            onTriggered: {
                zombie1 = entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("Zombie.qml"), { "y": 70});
                //zombie1atk = entityManager.getEntityById(zombie1).attack
                console.log("zombie1",zombie1)
            }
        }

        Timer{
            id:creatzombie2
            interval: 16000
            running: true
            repeat: false
            onTriggered: {
                var zombie2 = entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("Zombie.qml"), { "y": 30});
                console.log("zombie2",zombie2)
            }
        }

        Timer{
            id:creatzombie3
            interval: 20000
            running: true
            repeat: false
            onTriggered: {
                var zombie3 = entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("Zombie.qml"), { "y": 170});
                console.log("zombie3",zombie3)
            }
        }
        Timer{
            id:creatzombieCZ
            interval: 30000
            running: true
            repeat: false
            onTriggered: {
                var zombie4 =   entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("ZombieRoadBlock.qml"), { "y": 70});
                console.log("zombie4",zombie4)
                var zombie5 = entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("ZombieRoadBlock.qml"), { "y": 120});
                console.log("zombie5",zombie5)
            }
        }

        Timer{
        id:creatzombieBk
        interval: 40000
        running: true
        repeat: false
        onTriggered: {

            var zombie6 = entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("BucketZombie.qml"), { "y": 30});
            console.log("zombie6",zombie6)
            var zombie7 =entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("BucketZombie.qml"), { "y": 230});
            console.log("zombie7",zombie7)
        }
    }

        Timer{
        id:check
        interval: 1000
        running: false
        repeat: true
        onTriggered: {
        gameScene.checkallzombieremoved()
            }
        }

        Timer{
        interval: 40000
        running: true
        repeat: false
        onTriggered: {
        check.running = true
        }
        }

        Button{
        height: 20
        width:30
        text: "清除僵尸"
        onClicked: {entityManager.removeAllEntities()}
        }



    }
