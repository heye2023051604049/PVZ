//wenrenqiang
import QtQuick
import Felgo 4.0

//EntityBase{
//    id:zombie
//    property string hp
//    anchors.centerIn: parent


    SpriteSequence{
    id:zbam
    //source:"assets/walking.png"
    width: 150
    height:230
    goalSprite: "walk"

        Sprite{
        name:"walk"
        //sourceRect:Qt.rect(0, 0, 169,239)
        source:"../assets/walking.png"
        frameCount: 17
        frameWidth: 150
        frameHeight: 230
        frameX:169
        frameY:0


        }

//        }






}


