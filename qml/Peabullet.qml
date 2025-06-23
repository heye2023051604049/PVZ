//wenrenqiang
import QtQuick
import Felgo

EntityBase{
    id:peabullet
    entityType: "bullet"
    width:10
    height:10
    property int attack: 30


    //x:400
    //y:120

    CircleCollider{
    id:pb
    radius: parent.width/2
    anchors.centerIn: parent
    fixture.friction: 0
    fixture.restitution: 1
    sensor: true
    //bullet: true

    property string colliderType :"bullet"

    categories:Box.Category1
    collidesWith: Box.Category2


    fixture.onBeginContact: other=>{

    peabullet.removeEntity();
        //console.log("boom");

        var otherEntity = other.getBody().target;
        if(otherEntity.entityType === "zombie") {
        console.log("boom")
        otherEntity.hp = otherEntity.hp-attack;
        console.log("zombieHp",otherEntity.hp)
                                }

    }



    }

    Image{id:bullet
        source:Qt.resolvedUrl("../assets/Peabullet.png")
        width:parent.width
        height:parent.height
    }


    Timer{
    id:shoot
    interval: 500
    running:true
    repeat: true
    onTriggered: {
        //peabullet.x= peabullet.x+1.5;
        pb.body.applyLinearImpulse(Qt.point(20, 0), pb.body.getWorldCenter())}

    }



}
