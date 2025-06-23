import QtQuick
import Felgo

EntityBase{
    id:sunflw
    property int hp :80
    entityType: "plant"
    property int attack
    width: 40
    height: 40

    // 阳光生成相关属性
    property int sunGenerateInterval: 10000 // 10秒生成一次阳光
    property int sunValue: 25 // 每个阳光值
    property var gameScene // 用于引用游戏场景

    y: 100

    // 初始化时设置定时器
    Component.onCompleted: {
        sunGenerateTimer.start()
    }

    // 阳光生成定时器
    Timer {
        id: sunGenerateTimer
        interval: sunGenerateInterval
        repeat: true
        running: false
        onTriggered: generateSun()
    }

    // 生成阳光函数
    function generateSun() {
        if(gameScene && gameScene.width && gameScene.height) {
            // 在向日葵上方生成阳光(确保初始位置在屏幕内)
            var sunX = sunflw.x + (Math.random() * 60 - 30)
            var sunY = Math.max(0, sunflw.y - 30) // 从上方出现

            // 计算最大允许下落距离
            var maxDropDistance = gameScene.height - sunY - 30 // 保留30像素余量

            // 调用游戏场景的生成方法，传递最大下落距离
            gameScene.generateSunAt(sunX, sunY, sunValue, maxDropDistance)
        }
    }

    GameSpriteSequence{
        id:plam
        width: 40
        height: 40
        goalSprite: "relax"

        GameSprite{
            name:"relax"
            source:Qt.resolvedUrl("../assets/Sunflower.png")
            frameCount: 18
            frameWidth: 73
            frameHeight: 74
            frameX:0
            frameY:0
            frameDuration: 150
        }
    }

    BoxCollider{
        id:body
        width: parent.width
        height: parent.height
        bodyType: Body.Static

        fixture.onBeginContact: (other) =>{
                                    console.log("attacked");
                                    var zbattk = other.getBody().target;

                                    damagecount.zombienumber +=1;
                                    damagecount.running=true;
                                }
        categories: Box.Category1
        collidesWith: Box.Category2

        fixture.onEndContact: (other) =>{
                                  damagecount.running=false;
                                  console.log("finished")
                              }
    }
    Timer{
    id:damagecount
    interval: 1000
    running:false
    repeat: true
    property int attack
    property int zombienumber: 0
    onTriggered: {
        attack = zombie.attack
        parent.hp= parent.hp-attack;
        attack = 0;
        console.log("HP",parent.hp)
        if (parent.hp<=0){
                damagecount.running=false;
                parent.removeEntity();
                zombie.anima.jumpTo("walk")
        }
    }
    }

    function enterrange () {
    attackrange.isEnterAttackrange = true;
    attackrange.number +=1;

    }

    function outofrange(){
    attackrange.number = attackrange.number -1;
    if(attackrange.number<=0){
    attackrange.isEnterAttackrange = false};
    }
}
