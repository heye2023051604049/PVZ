//wenrenqiang
import QtQuick
import Felgo 4.0

EntityBase{
    id:nut
    property int hp :400
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

    fixture.onBeginContact: (other) =>{

                            console.log("attacked");
                            var zbattk = other.getBody().target;

                            damagecount.zombienumber += 1;
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
    property int attack1
    property int zombienumber: 0
    onTriggered: {
        //ondamaged(zbattk);
        attack = zombie1.attack
        parent.hp= parent.hp-attack;
        attack = 0;
        //peashooter.hp= peashooter.hp-zbattk.attack;
        console.log("HP",parent.hp)

        if(parent.hp<= 250){plam.jumpTo("halfhp")}
        if(parent.hp<= 150){plam.jumpTo("lowhp")}

        if (parent.hp<=0){
                damagecount.running=false;
                parent.removeEntity();
                zombie.anima.jumpTo("walk")
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
