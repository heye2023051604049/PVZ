//wenrenqiang
import Felgo 4.0
import QtQuick
import QtQuick.Controls

Scene{
    id:gamescene
    Image {
        id:_gamebackground
        source: "../assets/background1.jpg"
        anchors.fill:parent
    }

    SeedBank{
        id:_seedbank
        anchors.top: parent.top
    }
}
