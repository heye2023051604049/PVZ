//wenrenqiang
import QtQuick
import Felgo

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
    id:plam
    //source:"../assets/Peashooter.png"
    width: 40
    height:40
    goalSprite:"relax"

        GameSprite{
        name:"relax"
        //sourceRect:Qt.rect(0, 0, 169,239)
        //source: "../assets/Peashooter.png"
        source: Qt.resolvedUrl("../assets/ReapeaterPea.png")
        frameCount: 15
        frameWidth: 73
        frameHeight: 71
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
    width: parent.width
    height: parent.height
    bodyType: Body.Static //静态物体
    property string bdzbid1
    property string bdzbid2
    property int enermynumber:0

    fixture.onBeginContact: (other) =>{

                                console.log("attacked");
                                var bdzb = other.getBody().target;
                                bdzbid1  = bdzb.entityId;

                                enermynumber +=1
                                damagecount1.zombienumber += 1;
                                damagecount1.running=true;

                                if(enermynumber>1){bdzbid2 = bdzb.entityId
                                                    damagecount2.running = true;}

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







    /*Timer{
    id:damagecount
    interval: 1000
    running:false
    repeat: true
    property int attack
    property int attack2
    property int zombienumber: 0
    onTriggered: {
        //ondamaged(zbattk);
        attack = zombie1.attack
        parent.hp= parent.hp-attack;
        attack = 0;

        //attack2 = zombie2.attack
        //parent.hp= parent.hp-attack;
        //attack = 0;


        console.log("HP",parent.hp)

        if (parent.hp<=0){
                damagecount.running=false;
                parent.removeEntity();
                zombie1.anima.jumpTo("walk")
        }


    }

    }*/


Timer{
id:damagecount1
interval: 1000
running:false
repeat: true
property int attack
property int zombienumber: 0
onTriggered: {
    //ondamaged(zbattk);
    var zb1 = entityManager.getEntityById(body.bdzbid1)

    if(zb1){
    attack = zb1.attack
    console.log("zombieatttack",attack)
        parent.hp= parent.hp-attack
        attack = 0;}


    //parent.hp= parent.hp-attack1;
    //attack = 0;

    console.log("HP",parent.hp)

    if (parent.hp<=0){
            damagecount1.running=false;
            parent.removeEntity();
            zb1.anima.jumpTo("walk")
}


}

}


Timer{
id:damagecount2
interval: 1000
running:false
repeat: true
property int attack
property int zombienumber: 0
onTriggered: {
    //ondamaged(zbattk);
    var zb2 = entityManager.getEntityById(body.bdzbid2)

    if(zb2){
    attack = zb2.attack
    console.log("zombieatttack",attack)
        parent.hp= parent.hp-attack
        attack = 0;}


    if (parent.hp<=0){
            damagecount2.running=false
            zb2.anima.jumpTo("walk");

}


}

}

    Timer{
    id:attck
    interval: 1000
    running: true
    repeat: true
    onTriggered: {

        if(attackrange.isEnterAttackrange == true){
        fireBullet();
        }

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

    /*function ondamaged(zbattk){
        peashooter.hp= peashooter.hp-zombie.attack;
        console.log("HP",peashooter.hp)

        if (peashooter.hp<=0){
                damagecount.running=false;
                peashooter.removeEntity();
                zombie.anima.jumpTo("walk")
    }
    }*/







}
