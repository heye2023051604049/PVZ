//wenrenqiang
//这是一个僵尸，有实体，有hp,attack属性
import QtQuick
import Felgo

EntityBase{
    //id:zombie

    property alias anima: zbam


    property int hp :800
    //anchors.centerIn: parent
    entityType: "zombie2"
    property int attack :25
    width:  64
    height: 64

    x:400
    y:70

    GameSpriteSequence{//僵尸动画合集
    id:zbam
    width: parent.width
    height:parent.height
    //goalSprite:"walk"

        //走路
        GameSprite{
        name:"walk"
        source: Qt.resolvedUrl("../assets/ConeZBwalk.png")
        frameCount: 21
        frameWidth: 166
        frameHeight: 144
        frameX:0
        frameY:0
        frameDuration: 250
        //to: {}
        //to: {"eat":1,"die":1}
        }

        //攻击
        GameSprite{
        name:"eat"
        //source: "../assets/ZBeat.png"
        source: Qt.resolvedUrl("../assets/ConeZBeat.png")
        frameCount: 11
        frameWidth:166
        frameHeight: 144
        frameX:0
        frameY:0
        frameDuration: 250
        //to: {"die":1,"walk":1}
        }

        //死亡

    }


    BoxCollider{
    id:zb
    width: parent.width/2
    height: parent.height/2
    anchors.bottom: parent.bottom
    anchors.right: parent.right
    bodyType: Body.Dynamic //动态物体
    density: 1 //密度
    //friction: 0.5 //摩擦系数


    categories: Box.Category2
    collidesWith: Box.Category1


        fixture.density: 1
        fixture.friction: 0.5


        fixture.onBeginContact: other =>{

        var otherEntity = other.getBody().target;

        if(otherEntity.entityType === "plant" /*&& colliderType === "body"*/ )    {
        zbam.jumpTo("eat")
        zbwalk.running =true;
                                }
     }

        fixture.onEndContact: other =>{
        //zbam.jumpTo("walk")
        console.log("eatfinished")
        parent.removeEntity()
                              }



    }




    Timer{
    id:zbtm
    interval: 500
    running:true
    repeat: true
    onTriggered: {
        //zombie.x= zombie.x-1;
        zb.body.applyLinearImpulse(Qt.point(-200, 0), zb.body.getWorldCenter())}

    }

    Timer{
    id:damagecount
    interval:100
    running: true
    repeat: true
    onTriggered: {
    if(hp<=0){
    zbam.jumpTo("die")
    //zombie.x= zombie.x+1;
    //damagecount.running=false;
    //zb.body.applyLinearImpulse(Qt.point(300, 0), zb.body.getWorldCenter())
    parent.removeEntity()
    }

    }

    }

    Timer{
    id:zbwalk
    interval:15000
    running:false
    repeat: true
    onTriggered: {
    zbam.jumpTo("walk")

    }

    }


}

