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

    y:100


    //property var colliders: []//存放的collider

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
    id:body
    width: peashooter.width
    height: peashooter.height
    bodyType: Body.Static //静态物体

    fixture.onBeginContact: (other) =>{

                            console.log("attacked");
                            var zbattk = other.getBody().target;

                            damagecount.running=true;



                            }

    categories: Box.Category1
    collidesWith: Box.Category2

    fixture.onEndContact: (other) =>{
                          damagecount.running=false;
                          console.log("finished")
                          }

    }


EntityBase{
    id:attackrange
    //anchors.left: parent.left
    height: parent.height
    width:parent.width*10 //可设置攻击范围
    entityType: "range"

    x:parent.x
    y:parent.y

    property bool isEnterAttackrange: false
    property int number: 0

    BoxCollider{
    id:ar

    sensor: true



    categories: Box.Category1
    collidesWith: Box.Category2


    fixture.onBeginContact: other =>{
        console.log("进入攻击范围")
        enterrange()
       }

    fixture.onEndContact: other =>{
        console.log("离开攻击范围")
        outofrange()
        }

    }

}
    /*Component.onCompleted:{
        if (!fixture) {
        Qt.callLater(()=>peashooter.colliders.push(attackrange));
        console.log("attackrange.fixtrue",attackrange.fixture)
        } else {
        peashooter.colliders.push(attackrange);
        console.log("attackrange.fixtrue",attackrange.fixture)}
                }
    }*/







    Timer{
    id:damagecount
    interval: 1000
    running:false
    repeat: true
    onTriggered: {      
        ondamaged();

    }

    }

    Timer{
    id:attck
    interval: 2000
    running: true
    repeat: true
    onTriggered: {

        if(attackrange.isEnterAttackrange == true){
        fireBullet();}
        //fireBullet()
    }

    }

    // 生成子弹
    function fireBullet() {
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("Peabullet.qml"), {
            x: peashooter.x+30,
            y: peashooter.y+5  //需手动跟换id
            //velocity: Qt.point(0, -500)
        })
    }

    // 生成攻击范围
    /*function attackrange() {
        entityManager.createEntityFromUrlWithProperties(Qt.resolvedUrl("PeashooterAr.qml"), {
            x: peashooter.x+30,
            y: peashooter.y+5  //需手动跟换id
            //velocity: Qt.point(0, -500)
        })
    }    */


    function enterrange () {
    attackrange.isEnterAttackrange = true;
    attackrange.number +=1;

    }

    function outofrange(){
    attackrange.number = attackrange.number -1;
    if(attackrange.number<=0){
    attackrange.isEnterAttackrange = false};
    }

    function ondamaged(){
        peashooter.hp= peashooter.hp-zombie.attack;
        console.log("HP",peashooter.hp)

        if (peashooter.hp<=0){
                damagecount.running=false;
                peashooter.removeEntity();
                zombie.anima.jumpTo("walk")
    }
    }

//WithProperties

}

