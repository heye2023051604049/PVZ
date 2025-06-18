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
    // Button{
    //     id:_options
    //     x:320;y:235;z:1
    //     width:44;height:50
    //     background: Rectangle {
    //         color: "transparent" // 设置背景为透明
    //         border.color: "transparent" // 确保边框也是透明的
    //         //border.color: "#888"
    //     }
    //     TapHandler{
    //         onTapped: {
    //             console.log("options was clicked")
    //         }
    //     }

    //     Image {
    //         id:_optionsImage
    //         x:1;y:25
    //         width: 44
    //         fillMode: Image.PreserveAspectFit // 保持宽高比，填充容器
    //         source: "../assets/SelectorScreen_Options2.png"
    //         visible:options.hovered
    //     }
    // }
    HoveredButton {
        id:_quit
        x:392; y:243
        width: 40; height: 50
        imageSource:"../assets/SelectorScreen_Quit2.png"
        imageX:5;imageY:30;imageWidth: 27
        TapHandler{
            onTapped: {
                console.log("quit was clicked")
            }
        }
    }
    // Button{
    //     id:_quit
    //     x:392;y:243;z:1
    //     width:40;height:50
    //     background: Rectangle{
    //         color: "transparent"
    //         border.color: "transparent"
    //         //border.color: "#888"test the button's position
    //     }
    //     TapHandler{
    //         onTapped: {
    //             console.log("quit was clicked")
    //             Qt.quit()
    //         }
    //     }
    //     Image {
    //         id:_quitImage
    //         x:5;y:30
    //         width: 27
    //         fillMode: Image.PreserveAspectFit
    //         source: "../assets/SelectorScreen_Quit2.png"
    //         visible:quit.hovered
    //     }
    // }
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
    // Button{
    //     id:_help
    //     x:358;y:238;z:1
    //     width:34;height:60
    //     background: Rectangle {
    //         color: "transparent"
    //         border.color: "transparent"
    //     }
    //     TapHandler{
    //         onTapped: {
    //             console.log("help was clicked")
    //         }
    //     }

    //     Image {
    //         id:_helpImage
    //         x:5;y:43
    //         width: 26
    //         fillMode: Image.PreserveAspectFit
    //         source: "../assets/SelectorScreen_Help2.png"
    //         visible:help.hovered
    //     }
    // }
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
    // Button{
    //     id:_adventure
    //     x:240;y:36;z:1
    //     width:170;height:70
    //     background: Rectangle {
    //         color: "transparent"
    //         border.color: "transparent"
    //     }
    //     TapHandler{
    //         onTapped: {
    //             console.log("start")
    //             beginTapped()
    //         }
    //     }

    //     Image {
    //         id:_adventureImage
    //         width: 170
    //         fillMode: Image.PreserveAspectFit
    //         source: "../assets/SelectorScreen_StartAdventure_Highlight.png"
    //         visible:adventure.hovered
    //     }
    // }
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
    // Button{
    //     id:_miniGames
    //     x:242;y:103;z:1
    //     width:170;height:45
    //     background: Rectangle {
    //         color: "transparent"
    //         border.color: "transparent"
    //     }
    //     TapHandler{
    //         onTapped: {
    //             console.log("minigames was clicked")
    //         }
    //     }

    //     Image {
    //         y:-10
    //         id:_miniGamesImage
    //         width: 160
    //         fillMode: Image.PreserveAspectFit
    //         source: "../assets/SelectorScreen_Survival_highlight.png"
    //         visible:miniGames.hovered
    //     }
    // }
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
    // Button{
    //     id:_puzzle
    //     x:243;y:150;z:1
    //     width:150;height:40
    //     background: Rectangle {
    //         color: "transparent"
    //         border.color: "transparent"
    //     }
    //     TapHandler{
    //         onTapped: {
    //             console.log("puzzle was clicked")
    //         }
    //     }

    //     Image {
    //         y:-12
    //         id:_puzzleImage
    //         width: 145
    //         fillMode: Image.PreserveAspectFit
    //         source: "../assets/SelectorScreen_Challenges_highlight.png"
    //         visible:puzzle.hovered
    //     }
    // }
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
    // Button{
    //     id:_survival
    //     x:246;y:188;z:1
    //     width:150;height:40
    //     background: Rectangle {
    //         color: "transparent"
    //         border.color: "transparent"
    //     }
    //     TapHandler{
    //         onTapped: {
    //             console.log("survival was clicked")
    //         }
    //     }

    //     Image {
    //         y:-12
    //         id:_survivalImage
    //         width: 135
    //         fillMode: Image.PreserveAspectFit
    //         source: "../assets/SelectorScreen_vasebreaker_highlight.png"
    //         visible:survival.hovered
    //     }
    // }
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

