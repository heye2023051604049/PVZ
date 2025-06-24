//the integration of all the parts
import Felgo
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
            PropertyChanges {target: gameTitle;opacity:1}
            PropertyChanges {target: gameWindow; activeScene: gameTitle}



        },
        State {
            name: "game"
            PropertyChanges {target: gameScene;opacity:1}
            PropertyChanges {target: gameWindow; activeScene: gameScene}

        }
    ]

    GameTitle{
        id:_gameTitle;opacity: 0
        onBeginTapped: {
            gameWindow.state ="game"
            gameTitle.bgm.backgroundMusic.stop()
        }

    }

    GameScene{
        id:_gameScene;opacity:  0

        Zombie{id:zombie1;y:70}
        Zombie{id:zombie2;y:70;x:410}
        ZombieRoadBlock{y:30}
        BucketZombie{y:120}
        //Zombie{}
        //Zombie{}
        Peashooter{x:200;y:200}
        Peashooter{x:300;y:150}
        //Peashooter{x:50}
        Nut{x:300;y:50}
        //Peashooter{x:300}
        //Peashooter{x:380}
        DoublePeashooter{x:100;y:100}
        //Peabullet{id:peabullet}
        PhysicsWorld{
        debugDrawVisible: true
        updatesPerSecondForPhysics:60
        //gravity. y:10

        }

        EntityManager {id:entityManager; entityContainer: gameScene}

    }



}
