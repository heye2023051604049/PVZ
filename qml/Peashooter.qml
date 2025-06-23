//wenrenqiang
import QtQuick
import Felgo 4.0

EntityBase{
    id:peashooter
    property int hp :150
    //anchors.centerIn: parent
    entityType: "plant"
    property int attack
    width:  40
    height: 40

    //y:100

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
        }


    //to do 攻击动画
        /*Sprite{
        name:"shoot"
        source: "../assets/Peashooter.png"
        frameCount: 19
        frameWidth:332
        frameHeight: 288
        frameX:0
        frameY:0
        frameDuration: 250

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

    /*BoxCollider{
    id:attackrange
    width:600
    anchors.left: parent.left
    sensor: true

    fixture.
    }*/







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

    Timer{
    id:attck
    interval: 2000
    running: true
    repeat: true
    onTriggered: {fireBullet();}

    }

    // 生成子弹
    function fireBullet() {
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("Peabullet.qml"), {
            x: peashooter.x+30,
            y: peashooter.y+5  //需手动跟换id
            //velocity: Qt.point(0, -500)
        })
    }

//WithProperties

}

