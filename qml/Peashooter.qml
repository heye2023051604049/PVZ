//wenrenqiang
import QtQuick
import Felgo 4.0

EntityBase{
    id:peashooter
    property int hp :150
    //anchors.centerIn: parent
    entityType: "peashooter"
    property int attack
    width:  40
    height: 40

    x:340
    y:100


    GameSpriteSequence{
    id:psam
    //source:"../assets/Peashooter.png"
    width: 40
    height:40
    goalSprite:"relax"

        GameSprite{
        name:"relax"
        //sourceRect:Qt.rect(0, 0, 169,239)
        //source: "../assets/Peashooter.png"
        source: Qt.resolvedUrl("../assets/Peashooter.png")
        frameCount: 13
        frameWidth: 142
        frameHeight: 142
        frameX:0
        frameY:0
        frameDuration: 150
        //to: {"eat":1,"die":1}
        }

        /*Sprite{
        name:"shoot"
        source: "../assets/Peashooter.png"
        frameCount: 19
        frameWidth:332
        frameHeight: 288
        frameX:0
        frameY:0
        frameDuration: 250
        //to: {"die":1,"walk":1}
    }*/



    }

    BoxCollider{
    id:ps
    width: peashooter.width
    height: peashooter.height
    bodyType: Body.Static //静态物体



    fixture.onBeginContact: (other) =>{

                            console.log("attacked");
                            damagecount.running=true;



                            }

    categories: Box.Category1
    collidesWith: Box.Category2


    }









    Timer{
    id:damagecount
    interval: 1000
    running:false
    repeat: true
    onTriggered: {
        peashooter.hp= peashooter.hp-zombie.attack;
        console.log("HP",peashooter.hp)

        if (peashooter.hp<=0){
                damagecount.running=false;
                peashooter.removeEntity();
                zombie.anima.jumpTo("walk")
        }


    }

    }



}

