//wenrenqiang
//这是一个僵尸，有实体，有hp,attack属性
import QtQuick
import Felgo 4.0

EntityBase{
    id:zombie

    property alias anima: zbam


    property int hp :500
    //anchors.centerIn: parent
    entityType: "zombie"
    property int attack :20
    width:  64
    height: 64

    x:400
    y:100

    GameSpriteSequence{
    id:zbam
    width: 64
    height:64
    //goalSprite:"walk"

        GameSprite{
        name:"walk"
        //sourceRect:Qt.rect(0, 0, 169,239)
        source: Qt.resolvedUrl("../assets/ZBwalik.png")
        frameCount: 17
        frameWidth: 332
        frameHeight: 288
        frameX:0
        frameY:0
        frameDuration: 250
        //to: {}
        //to: {"eat":1,"die":1}
        }

        GameSprite{
        name:"eat"
        //source: "../assets/ZBeat.png"
        source: Qt.resolvedUrl("../assets/ZBeat.png")
        frameCount: 19
        frameWidth:332
        frameHeight: 288
        frameX:0
        frameY:0
        frameDuration: 250
        //to: {"die":1,"walk":1}
        }

        GameSprite{
        name:"die"
        //source:"../assets/ZBdie.png"
        source: Qt.resolvedUrl("../assets/ZBdie.png")
        frameCount: 9
        frameWidth: 446
        frameHeight: 265
        frameX: 0
        frameY: 0
        frameDuration: 330
        //to: {"walk":1,"eat":1}
        }


    }

    BoxCollider{
    id:zb
    width: zombie.width
    height: zombie.height
    bodyType: Body.Dynamic //动态物体
    density: 1 //密度
    //friction: 0.5 //摩擦系数


    categories: Box.Category2
    collidesWith: Box.Category1




        fixture.density: 1
        fixture.friction: 0.5


        fixture.onBeginContact: other =>{
        zbam.jumpTo("eat");
        console.log("38283");
        console.log("peznhads");

        }

        fixture.onEndContact: other=> {
            console.log("碰撞结束!");
            //zbam.jumpTo("walk");
        }


    }

    Timer{
    id:zbtm
    interval: 500
    running:true
    repeat: true
    onTriggered: {
        zombie.x= zombie.x-1;
        zb.body.applyLinearImpulse(Qt.point(-200, 0), zb.body.getWorldCenter())}

    }

    Timer{
    id:damagecount

    //to do


    }



}
