import Felgo 4.0
import QtQuick
import QtQuick.Controls

Scene{
    property string path
    Image{
        id:image1
    anchors.fill: parent
    source: "../assets/background1.jpg"
    }

    HoveredButton {
        id:p11;x:86; y:40;width: 55; height: 55
        imageSource:path;imageY:-12;imageWidth: 145
        TapHandler{
            onTapped: {
                console.log("11 was clicked")
                var randomX = Math.random() * (image1.width - image2.width);
                var randomY = Math.random() * (image1.height - image2.height);
                image2.x = image1.x + randomX;
                image2.y = image1.y + randomY;
                image2.visible = true;
            }
        }
    }
    HoveredButton {
        id:p12;x:142; y:40;width: 55; height: 55;
        imageSource:path;imageY:-12;imageWidth: 145
        TapHandler{
            onTapped: {
                console.log(" was clicked")
            }
        }
    }
    HoveredButton {
        id:p13;x:198; y:40;width: 55; height: 55
        imageSource:path;imageY:-12;imageWidth: 145
        TapHandler{
            onTapped: {
                console.log(" was clicked")
            }
        }
    }
    HoveredButton {
        id:p14;x:254; y:40;width: 55; height: 55
        imageSource:path;imageY:-12;imageWidth: 145
        TapHandler{
            onTapped: {
                console.log(" was clicked")
            }
        }
    }
    HoveredButton {
        id:p21;x:86; y:95;width: 55; height: 53
        imageSource:path;imageY:-12;imageWidth: 145
        TapHandler{
            onTapped: {
                console.log(" was clicked")
            }
        }
    }
    HoveredButton {
        id:p22;x:142; y:95;width: 55; height: 53
        imageSource:path;imageY:-12;imageWidth: 145
        TapHandler{
            onTapped: {
                console.log(" was clicked")
            }
        }
    }
    HoveredButton {
        id:p23;x:198; y:95;width: 55; height: 53
        imageSource:path;imageY:-12;imageWidth: 145
        TapHandler{
            onTapped: {
                console.log(" was clicked")
            }
        }
    }
    HoveredButton {
        id:p24;x:254; y:95;width: 55; height: 53
        imageSource:path;imageY:-12;imageWidth: 145
        TapHandler{
            onTapped: {
                console.log(" was clicked")
            }
        }
    }
    HoveredButton {
        id:p31;x:86; y:148;width: 55; height: 53
        imageSource:path;imageY:-12;imageWidth: 145
        TapHandler{
            onTapped: {
                console.log(" was clicked")
            }
        }
    }
    HoveredButton {
        id:p32;x:142; y:148;width: 55; height: 53
        imageSource:path;imageY:-12;imageWidth: 145
        TapHandler{
            onTapped: {
                console.log(" was clicked")
            }
        }
    }
    HoveredButton {
        id:p33;x:198; y:148;width: 55; height: 53
        imageSource:path;imageY:-12;imageWidth: 145
        TapHandler{
            onTapped: {
                console.log(" was clicked")
            }
        }
    }
    HoveredButton {
        id:p34;x:254; y:148;width: 55; height: 53
        imageSource:path;imageY:-12;imageWidth: 145
        TapHandler{
            onTapped: {
                console.log(" was clicked")
            }
        }
    }
    HoveredButton {
        id:p41;x:86; y:201;width: 55; height: 53
        imageSource:path;imageY:-12;imageWidth: 145
        TapHandler{
            onTapped: {
                console.log(" was clicked")
            }
        }
    }
    HoveredButton {
        id:p42;x:142; y:201;width: 55; height: 53
        imageSource:path;imageY:-12;imageWidth: 145
        TapHandler{
            onTapped: {
                console.log(" was clicked")
            }
        }
    }
    HoveredButton {
        id:p43;x:198; y:201;width: 55; height: 53
        imageSource:path;imageY:-12;imageWidth: 145
        TapHandler{
            onTapped: {
                console.log(" was clicked")
            }
        }
    }
    HoveredButton {
        id:p44;x:254; y:201;width: 55; height: 53
        imageSource:path;imageY:-12;imageWidth: 145
        TapHandler{
            onTapped: {
                console.log(" was clicked")
            }
        }
    }
    HoveredButton {
        id:p51;x:86; y:254;width: 55; height: 53
        imageSource:path;imageY:-12;imageWidth: 145
        TapHandler{
            onTapped: {
                console.log(" was clicked")
            }
        }
    }
    HoveredButton {
        id:p52;x:142; y:254;width: 55; height: 53
        imageSource:path;imageY:-12;imageWidth: 145
        TapHandler{
            onTapped: {
                console.log(" was clicked")
            }
        }
    }
    HoveredButton {
        id:p53;x:198; y:254;width: 55; height: 53
        imageSource:path;imageY:-12;imageWidth: 145
        TapHandler{
            onTapped: {
                console.log(" was clicked")
            }
        }
    }
    HoveredButton {
        id:p54;x:254; y:254;width: 55; height: 53
        imageSource:path;imageY:-12;imageWidth: 145
        TapHandler{
            onTapped: {
                console.log(" was clicked")
            }
        }
    }
    // Button{
    //     id:_options
    //     x:86;y:40
    //     width:29;height:55
    //     background: Rectangle {
    //         color: "transparent" // 设置背景为透明
    //         //border.color: "transparent" // 确保边框也是透明的
    //         border.color: "#888"
    //     TapHandler{
    //         onTapped: {
    //         //    console.log("options was clicked")
    //         }
    //     }

    //        Image {
    //            id:_optionsImage
    //            opacity: 0.4
    //             anchors.horizontalCenter: parent.horizontalCenter
    //             anchors.verticalCenter: parent.verticalCenter
    //             fillMode: Image.PreserveAspectFit // 保持宽高比，填充容器
    //             //source: "../assets/SelectorScreen_Options2.png"
    //             visible:_options.hovered
    //             source:path
    //         }
    //     }
    // }
    Image {
        id:a
        opacity: 1
        width:50;height:50
         fillMode: Image.PreserveAspectFit // 保持宽高比，填充容器
         source: "../assets/SelectorScreen_Options2.png"
         //visible:_options.hovered
         TapHandler{
             onTapped: {
                 path=a.source
             }
         }
     }
    component HoveredButton: Button{
        property alias imageSource : image.source
        property alias imageX: image.x
        property alias imageY: image.y
        property alias imageWidth: image.width

        id:button
        background: Rectangle{id:rectangle;color:"transparent";border.color:"#888"}
        Image{id:image;fillMode: Image.PreserveAspectFit;visible:button.hovered;
            opacity: 0.4
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter}
    }
    //id:gamescene
    property int sunCount: 50
    // Image {
    //     id:_gamebackground
    //     source: "../assets/background1.jpg"
    //     anchors.fill:parent
    // }

    SunBank{
        id:_sunbank
        anchors{
            top: parent.top
            left:parent.left
            margins: 5
        }
        sunCount: parent.sunCount
    }

    SeedBank{
        id:_seedbank
        anchors.bottom: parent.bottom
        sunCount: parent.sunCount

        onPlantSelected: {
            console.log("Plant selected:",plantName)
        }

        function addSun(amount){
            sunCount += amount
        }

        function plantPlanted(plantType,x,y){
            var plantData=_seedbank.plantTypes.find(p => p.name === plantType)
            if(plantData){
                sunCount -= plantData.cost

                _seedbank.selectedPlantIndex = -1
            }
        }
    }

    function plantPlanted(plantType, x, y) {
            // 找到对应的植物类型
            var plantData = seedBank.plantTypes.find(p => p.name === plantType)
            if (plantData) {
                // 扣除阳光
                sunCount -= plantData.cost

                // 重置选择
                seedBank.selectedPlantIndex = -1

                // 实际创建植物...
                // createPlant(plantType, x, y)
            }
        }
}

