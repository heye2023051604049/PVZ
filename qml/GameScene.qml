import Felgo 4.0
import QtQuick
import QtQuick.Controls

Scene{
    id:gamescene
    property int sunCount: 50
    Image {
        id:_gamebackground
        source: "../assets/background1.jpg"
        anchors.fill:parent
    }

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
