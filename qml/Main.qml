//the integration of all the parts
import Felgo 4.0
import QtQuick
import QtQuick.Controls
GameWindow{
    id:gameWindow
    property alias gametitle: _gametitle
    //color: "white"
    //width:640
    //height:480
    title:qsTr("PlantsVSZombies,你们知道吗，什么，不会吧，真的吗")
    visible:true

//wenrenqiang
  //  state:"game"

   /* MenuScene{
    id:menuScene
    Image{
    Zombie{id:aa
    }
    }
    }*/
    /*GameScene{
    id:gameScene
    Image{
    Zombie{id:bb}
    }
    }*/


//activeScene: menuScene

/*states:[
  State{
  name:"menu"

    PropertyChanges{

    target:gameWindow;
    activeScene: menuScene
    }
    },

  State{
  name:"game"

    PropertyChanges{

    target:gameWindow;
    activeScene: gameScene
    }


    }


]*/


    GameTitle{
        id:_gametitle
    }


}
