import Felgo
import QtQuick
import QtQuick.Controls

Scene{
    id:gameScene
    property string shadowPath
    property string examplePath
    property Component plantingComponent
    property double xPosition
    property double yPosition
    property alias seedBank:_seedbank
    property var currentPlant
    property var currentPlantList:[]
    Image{
        id:image1
    anchors.fill: parent
    source: "../assets/background1.jpg"
    }

    HoveredButton {
        id:p11;x:86;  y:40; width: 55; height: 55;imageSource:shadowPath;}
    HoveredButton {
        id:p12;x:142; y:40; width: 55; height: 55;imageSource:shadowPath;}
    HoveredButton {
        id:p13;x:198; y:40; width: 55; height: 55;imageSource:shadowPath;}
    HoveredButton {
        id:p14;x:254; y:40; width: 55; height: 55;imageSource:shadowPath;}
    HoveredButton {
        id:p21;x:86;  y:95; width: 55; height: 53;imageSource:shadowPath;}
    HoveredButton {
        id:p22;x:142; y:95; width: 55; height: 53;imageSource:shadowPath;}
    HoveredButton {
        id:p23;x:198; y:95; width: 55; height: 53;imageSource:shadowPath;}
    HoveredButton {
        id:p24;x:254; y:95; width: 55; height: 53;imageSource:shadowPath;}
    HoveredButton {
        id:p31;x:86;  y:148;width: 55; height: 53;imageSource:shadowPath;}
    HoveredButton {
        id:p32;x:142; y:148;width: 55; height: 53;imageSource:shadowPath;}
    HoveredButton {
        id:p33;x:198; y:148;width: 55; height: 53;imageSource:shadowPath;}
    HoveredButton {
        id:p34;x:254; y:148;width: 55; height: 53;imageSource:shadowPath;}
    HoveredButton {
        id:p41;x:86;  y:201;width: 55; height: 53;imageSource:shadowPath;}
    HoveredButton {
        id:p42;x:142; y:201;width: 55; height: 53;imageSource:shadowPath;}
    HoveredButton {
        id:p43;x:198; y:201;width: 55; height: 53;imageSource:shadowPath;}
    HoveredButton {
        id:p44;x:254; y:201;width: 55; height: 53;imageSource:shadowPath;}
    HoveredButton {
        id:p51;x:86;  y:254;width: 55; height: 53;imageSource:shadowPath;}
    HoveredButton {
        id:p52;x:142; y:254;width: 55; height: 53;imageSource:shadowPath;}
    HoveredButton {
        id:p53;x:198; y:254;width: 55; height: 53;imageSource:shadowPath;}
    HoveredButton {
        id:p54;x:254; y:254;width: 55; height: 53;imageSource:shadowPath;}
        TapHandler{
            onTapped: {
                console.log(" was clicked")
            }
        }


    component HoveredButton: Button{
        property alias imageSource : image.source
        property alias imageWidth: image.width

        id:button
        background: Rectangle{id:rectangle;color:"transparent";border.color:"#888"}
        Image{id:image;fillMode: Image.PreserveAspectFit;visible:button.hovered;
            opacity: 0.4;width:30
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter}
        TapHandler{
            onTapped: {
                var scenePos = button.mapToItem(gameScene, button.width/2, button.height/2)
                xPosition = scenePos.x//location active button
                yPosition = scenePos.y
                if(plantingComponent){
                    seedBank.plantPlanteddemo(plantingComponent)
                    console.log(plantingComponent)
                    gameScene.plantingComponent = null
                    gameScene.shadowPath=""
                   console.log("After reset - plantingComponent:", plantingComponent, "shadowPath:", shadowPath)
                           }
            }
        }
    }


    property int sunCount: 50
    property int maxSunCount: 9999

    SunBank{
        id:_sunbank
        anchors{
            top: parent.top
            left:parent.left
            margins: 5
        }
        sunCount: gameScene.sunCount
        autoGenerate: true
        generateInterval: 7000
        generateAmount: 1
        generateArea: parent
        //onSunCountChanged: parent.sunCount = sunCount

        onSunCollected: function(amount){
            gameScene.sunCount += amount
            if(gameScene.sunCount > gameScene.maxSunCount){
                gameScene.sunCount = gameScene.maxSunCount
            }
        }
    }
    // 手动生成测试按钮
    Button {
        text: "手动生成阳光"
        anchors.bottom: parent.bottom
        anchors.right: parent.right
        //anchors.horizontalCenter: parent.horizontalCenter
        onClicked: {
            _sunbank.generateRandomSuns()
            console.log("suncount:",_seedbank.sunCount)
        }
    }


    SeedBank{
        id:_seedbank
        anchors.bottom: parent.bottom
        sunCount: gameScene.sunCount

        onPlantSelected: {
            console.log("Plant selected:",plantName,plantComponent)
            shadowPath=shadowImage
            plantingComponent=plantComponent
        }

        /*function addSun(amount){
            sunCount += amount
        }*/

        function plantPlanteddemo(plantComponent){
            var plantData=_seedbank.plantTypes.find(p => p.plantComponent === plantComponent)
            if(plantData){
                if(gameScene.sunCount >= plantData.cost){
                gameScene.sunCount -= plantData.cost
                _seedbank.selectedPlantIndex = -1
                currentPlant = plantData.plantComponent.createObject(gameScene, {
                    x: xPosition - 20,  // 居中修正
                    y: yPosition - 20
                        })
                currentPlantList.push(currentPlant)
                }else{
                    console.log("Not enough sun")
                }
                console.log(currentPlantList.length)
            }
        }
    }
    Shovel{
        x:400;y:0
        MouseArea{
            anchors.fill:parent
            hoverEnabled: true
            onPositionChanged: {

            }
        }
    }
}
