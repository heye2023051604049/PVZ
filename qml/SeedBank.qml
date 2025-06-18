import Felgo
import QtQuick

Item {
    id:seedBank

    width: parent.width
    height: 30

    property var plantTypes: [
        { name:"Peashooter",cost:100,image:"../assets/pea-seed.png"},
        { name:"Sunflower",cost:50,image:"../assets/sunflw-seed.png"},
        { name:"Wallnut",cost:50,image:"../assets/nut-seed.png"}
    ]

    property int selectedPlantIndex:-1
    property int sunCount:0

    signal plantSelected(string plantName)

    Row{
        anchors.fill: parent
        spacing: 10

        Repeater {
            model: plantTypes

            SeedSlot {
                plantName: modelData.name
                plantCost: modelData.cost
                plantImage: modelData.image
                available: sunCount >= modelData.cost
                selected: seedBank.selectedPlantIndex === index

                onClicked: {
                    if (sunCount >= modelData.cost && !cooldownActive) {
                        seedBank.selectedPlantIndex = index
                        seedBank.plantSelected(modelData.name)
                    }
                }
            }
        }
    }

    /*Image {
        source: "../assets/SeedBank.png"
        x:100
        width: 200
        height: 30
        }*/
    }

