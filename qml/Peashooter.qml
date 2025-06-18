//wenrenqiang
import QtQuick
import Felgo 4.0

EntityBase{
    id:peashooter
    property string hp
    //anchors.centerIn: parent
    entityType: "peashooter"
    property string attack
    width:  40
    height: 40

    x:340



    SpriteSequence{
    id:psam
    //source:"../assets/Peashooter.png"
    width: 40
    height:40
    goalSprite:"relax"

        Sprite{
        name:"relax"
        //sourceRect:Qt.rect(0, 0, 169,239)
        source: "../assets/Peashooter.png"
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
    //density: 1 //密度
    //friction: 0.5 //摩擦系数

    categories: Box.Category1
    collidesWith: Box.Category2

    }

    /*Timer{
    interval: 500
    running:true
    repeat: true
    onTriggered: {zombie.x= zombie.x-0.5;}

    }*/



}
