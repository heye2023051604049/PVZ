//the menu of the game
import QtQuick
import QtQuick.Controls
import QtMultimedia
import Felgo 4.0
Scene{
    property alias options:_options
    property alias quit:_quit
    property alias help:_help
    property alias adventure:_adventure
    property alias miniGames:_miniGames
    property alias puzzle:_puzzle
    property alias survival:_survival
    id:menuscene
    signal beginTapped


    MediaPlayer {
        source:""
    }

    Image {
        id:_menu
        source: "../assets/menu.png"
        anchors.fill:parent
        TapHandler{
            onTapped: {
                //console.log("menu was clicked")
            }
        }
    }
    HoveredButton {
        id:_options
        x:320; y:235
        width: 44; height: 50
        imageSource:"../assets/SelectorScreen_Options2.png"
        imageX:1;imageY:25;imageWidth: 44
        TapHandler{
            onTapped: {
                console.log("options was clicked")
            }
        }
    }

    HoveredButton {
        id:_quit
        x:392; y:243
        width: 40; height: 50
        imageSource:"../assets/SelectorScreen_Quit2.png"
        imageX:5;imageY:30;imageWidth: 27
        TapHandler{
            onTapped: {
                console.log("quit was clicked")
               //EntityManager.removeAllEntities()//before quit  destory all entities
                Qt.quit()
            }
        }
    }

    HoveredButton {
        id:_help
        x:358; y:238
        width: 34; height: 60
        imageSource:"../assets/SelectorScreen_Help2.png"
        imageX:5;imageY:43;imageWidth: 26
        TapHandler{
            onTapped: {
                console.log("help was clicked")
            }
        }
    }

    HoveredButton {
        id:_adventure
        x:240; y:36
        width: 170; height: 70
        imageSource:"../assets/SelectorScreen_StartAdventure_Highlight.png"
        imageWidth: 170
        TapHandler{
            onTapped: {
                console.log("adventure was clicked")
                beginTapped()
            }
        }
    }

    HoveredButton {
        id:_miniGames
        x:242; y:103
        width: 170; height: 45
        imageSource:"../assets/SelectorScreen_Survival_highlight.png"
        imageY:-10;imageWidth:160
        TapHandler{
            onTapped: {
                console.log("options was clicked")
            }
        }
    }

    HoveredButton {
        id:_puzzle
        x:243; y:150
        width: 150; height: 40
        imageSource:"../assets/SelectorScreen_Challenges_highlight.png"
        imageY:-12;imageWidth: 145
        TapHandler{
            onTapped: {
                console.log("puzzle was clicked")
            }
        }
    }

    HoveredButton {
        id:_survival
        x:246; y:188
        width: 150; height: 40
        imageSource:"../assets/SelectorScreen_vasebreaker_highlight.png"
        imageY:-12;imageWidth: 135
        TapHandler{
            onTapped: {
                console.log("survival was clicked")
            }
        }
    }

    component HoveredButton: Button{
        property alias imageSource : image.source
        property alias imageX: image.x
        property alias imageY: image.y
        property alias imageWidth: image.width

        id:button
        background: Rectangle{id:rectangle;color:"transparent";border.color:"transparent"}
        Image{id:image;fillMode: Image.PreserveAspectFit;visible:button.hovered}
        }

    BackgroundMusic{
        source:""
    }

}

