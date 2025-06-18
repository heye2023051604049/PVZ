import Felgo
import QtQuick

Item {
    id:seedBank

    width: parent.width
    height: 45

    property var plantTypes: [
        { name:"Peashooter",cost:100,image:"../assets/pea-seed.png"},
        { name:"Sunflower",cost:50,image:"../assets/sunflw-seed.png"},
        { name:"Wallnut",cost:50,image:"../assets/nut-seed.png"}
    ]

    property int selectedPlantIndex:-1
    property int sunCount:50

    signal plantSelected(string plantName)

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

                onClicked: {
                    console.log("slot was clicked")
                    if (sunCount >= modelData.cost) {
                        seedBank.selectedPlantIndex = index
                        seedBank.plantSelected(modelData.name)
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

