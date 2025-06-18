//wenrenqiang
//这是一个僵尸，有实体，有hp,attack属性
import QtQuick
import Felgo 4.0

EntityBase{
    id:zombie
    property string hp
    //anchors.centerIn: parent
    entityType: "zombie"
    property string attack
    width:  64
    height: 64

    SpriteSequence{
    id:zbam
    //source:"../assets/walking.png"
    width: 64
    height:64
    goalSprite: "walk"

        Sprite{
        name:"walk"
        //sourceRect:Qt.rect(0, 0, 169,239)
        source: "../assets/ZBwalik.png"
        frameCount: 17
        frameWidth: 332
        frameHeight: 288
        frameX:0
        frameY:0
        frameDuration: 250
        }

        Sprite{
        name:"eat"
        source: "../assets/ZBeat.png"
        frameCount: 19
        frameWidth:332
        frameHeight: 288
        frameX:0
        frameY:0
        frameDuration: 250

        }

        Sprite{
        name:"die"
        source:"../assets/ZBdie.png"
        frameCount: 9
        frameWidth: 446
        frameHeight: 265
        frameX: 0
        frameY: 0
        frameDuration: 330

        }



    }

    BoxCollider{
    id:zb
    width: zombie.width
    height: zombie.height
    }





}


