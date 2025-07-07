//这是一个僵尸，有实体，有hp,attack属性
import QtQuick
import Felgo
import QtMultimedia
EntityBase{
    //id:zombie

    property alias anima: zbam
    property int hp :800
    property int attack :20
    entityType: "zombie"
    width:  64;height: 64
    x:400;y:70

    GameSpriteSequence{//僵尸动画合集
        id:zbam
        width: parent.width
        height:parent.height
        //goalSprite:"walk"

        //走路
        GameSprite{
            name:"walk"
            source: Qt.resolvedUrl("../assets/BucketZBwalk.png")
            frameCount: 15
            frameWidth: 166
            frameHeight: 144
            frameX:0
            frameY:0
            frameDuration: 250
        }

        //攻击
        GameSprite{
            name:"eat"
            source: Qt.resolvedUrl("../assets/BucketZBeat.png")
            frameCount: 11
            frameWidth:166
            frameHeight: 144
            frameX:0
            frameY:0
            frameDuration: 250
        }

        GameSprite{
            name:"die"
            source: Qt.resolvedUrl("../assets/ZBdie.png")
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
                                        zbwalk.running = true;

                                        switchTimer.start();
                                        eatingMusic.play()
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
                parent.removeEntity()
            }
        }
    }
    MediaPlayer{
        property int currentIndex:0
        property string eat1:"../assets/chomp.ogg"
        property string eat2:"../assets/chomp2.ogg"
        property string eat3:"../assets/chompsoft.ogg"
        property var eatMusicList:[]
        id:eatingMusic
        source:eatMusicList[currentIndex]
        loops: 1
        audioOutput: AudioOutput {
            id:_audioOutput
        }
    }
    MediaPlayer{
        property int currentIndex:0
        property string walk1:"../assets/groan.ogg"
        property string walk2:"../assets/groan2.ogg"
        property string walk3:"../assets/groan3.ogg"
        property string walk4:"../assets/groan4.ogg"
        property string walk5:"../assets/groan5.ogg"
        property string walk6:"../assets/groan6.ogg"
        property var walkMusicList:[]
        id:walkingMusic
        source:walkMusicList[currentIndex]
        loops: 1  // 无限循环播放
        audioOutput: AudioOutput {
            id:audioOutput
        }
    }
    Timer{
        id:switchTimer
        interval:1000
        repeat: true
        running: false
        onTriggered: {
            eatingMusic.currentIndex = (eatingMusic.currentIndex + 1) % eatingMusic.eatMusicList.length
            eatingMusic.source = eatingMusic.eatMusicList[eatingMusic.currentIndex]
            eatingMusic.play()
        }
    }
    Timer{
        id:switchTimer2
        interval:8000
        repeat: true
        running:true
        onTriggered: {
            walkingMusic.currentIndex = (walkingMusic.currentIndex + 1) % walkingMusic.walkMusicList.length
            walkingMusic.source = walkingMusic.walkMusicList[walkingMusic.currentIndex]
            walkingMusic.play()
        }
    }
    Component.onCompleted: {
        eatingMusic.eatMusicList.push(eatingMusic.eat1)
        eatingMusic.eatMusicList.push(eatingMusic.eat2)
        eatingMusic.eatMusicList.push(eatingMusic.eat3)
        console.log("Eat Music List:", eatingMusic.eatMusicList)
        walkingMusic.walkMusicList.push(walkingMusic.walk1)
        walkingMusic.walkMusicList.push(walkingMusic.walk2)
        walkingMusic.walkMusicList.push(walkingMusic.walk3)
        walkingMusic.walkMusicList.push(walkingMusic.walk4)
        walkingMusic.walkMusicList.push(walkingMusic.walk5)
        walkingMusic.walkMusicList.push(walkingMusic.walk6)
        console.log("walk Music List:",walkingMusic.walkMusicList)
    }

    Timer{
        id:zbwalk
        interval:20000
        running:false
        repeat: true
        onTriggered: {
            zbam.jumpTo("walk")
            eatingMusic.stop();
        }
    }
}

