//wenrenqiang
import QtQuick
import Felgo 4.0

EntityBase{
    id:nut
    property int hp :600
    //anchors.centerIn: parent
    entityType: "plant"
    //property int attack
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
        name:"maxhp"
        //sourceRect:Qt.rect(0, 0, 169,239)
        //source: "../assets/Peashooter.png"
        source: Qt.resolvedUrl("../assets/nut1.png")
        frameCount: 15
        frameWidth: 65
        frameHeight: 73
        frameX:0
        frameY:0
        frameDuration: 150
        }



        GameSprite{
        name:"halfhp"
        source: Qt.resolvedUrl("../assets/nut2.png")
        frameCount: 11
        frameWidth:65
        frameHeight: 73
        frameX:0
        frameY:0
        frameDuration: 150
        }

        GameSprite{
        name:"lowhp"
        source: Qt.resolvedUrl("../assets/nut33.png")
        frameCount: 15
        frameWidth:65
        frameHeight: 73
        frameX:0
        frameY:0
        frameDuration: 150
        }



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
                          damagecount1.running=false;
                          console.log("finished")
                          }

    }







    /*Timer{
    id:damagecount1
    interval: 1000
    running:false
    repeat: true
    property int attack
    property int zombienumber: 0
    onTriggered: {
        //ondamaged(zbattk);
        var zb1 = entityManager.getEntityById(zombie11.zombie1)

        if(zb1){
        attack = zb1.attack
        console.log("zombieatttack",attack)
            parent.hp= parent.hp-attack
            attack = 0;}


        //parent.hp= parent.hp-attack1;
        //attack = 0;

        console.log("HP",parent.hp)

        if(parent.hp<= 250){plam.jumpTo("halfhp")}
        if(parent.hp<= 150){plam.jumpTo("lowhp")}

        if (parent.hp<=0){
                damagecount1.running=false;
                parent.removeEntity();
                zb1.anima.jumpTo("walk")
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

        if(parent.hp<= 250){plam.jumpTo("halfhp")}
        if(parent.hp<= 150){plam.jumpTo("lowhp")}

        if (parent.hp<=0){
            //damagecount2.restart()
                damagecount1.running=false;                
                zb1.anima.jumpTo("walk")
                //console.log("666")
                parent.removeEntity();
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
        //if(parent.hp<=0) {damagecount1.restart()
        //                    zb2.jumpTo("walk")}


        var zb2 = entityManager.getEntityById(body.bdzbid2)

        if(zb2){
        attack = zb2.attack
        console.log("zombieatttack",attack)
            parent.hp= parent.hp-attack
            attack = 0;}

        if (parent.hp<=0){
                //damagecount1.restart()
                damagecount2.running=false
                //console.log("666")
                zb2.anima.jumpTo("walk");
                parent.removeEntity();
    }



    }

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
