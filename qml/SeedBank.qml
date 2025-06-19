import Felgo
import QtQuick

Item {
    id:seedBank

    width: parent.width
    height: 45

    property var plantTypes: [
        { name:"Peashooter",cost:100,image:"../assets/pea-seed.png",
            shadowImage:"../assets/peashooter1.png",plantComponent:Qt.createComponent("Peashooter.qml")},
        { name:"Sunflower",cost:50,image:"../assets/sunflw-seed.png",shadowImage:"../assets/sunflw.png"},
        { name:"Wallnut",cost:50,image:"../assets/nut-seed.png",shadowImage:"../assets/nut.png"}
    ]

    property int selectedPlantIndex:-1
    property int sunCount:50

    signal plantSelected(string plantName,string shadowImage,Component plantComponent)
    signal plantClicked(string plantName)

    Row{
        anchors.fill: parent
        spacing: 1

        Repeater {
            model: plantTypes

            SeedSlot {
                plantName: modelData.name
                plantCost: modelData.cost
                plantImage: modelData.image
                available: sunCount >= modelData.cost
                selected: seedBank.selectedPlantIndex === index
                shadowImage: modelData.shadowImage
                plantComponent: modelData.plantComponent

                onClicked: {
                    console.log("slot was clicked")
                    if (sunCount >= modelData.cost) {
                        seedBank.selectedPlantIndex = index
                        seedBank.plantSelected(modelData.name,modelData.shadowImage,modelData.plantComponent)
                    }
                }
            }
        }
    }

    /*Image {
        anchors.fill:parent
        source: "../assets/SeedBank.png"
        fillMode: Image.TileHorizontally
        z:-1
        }*/
    }

