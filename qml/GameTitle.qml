//the title of the game,when onpressed on the window,the title will come out

import QtQuick
import QtQuick.Controls
    Item{
        property alias begin:_begin
        property alias set:_set
        property alias quit: _quit
        Column {
            spacing:4
            Button{
                id: _begin
                width:180
                height:30
                background: Rectangle {
                    border.color: "#888"
                    border.width: 2
                    radius: 50
                    color: begin.hovered ? "lightgreen" : "lightblue"
                    //color: begin.pressed ? "lightgreen" : "lightblue"
                }
                Text {
                    text: qsTr("Begin the game")
                    font.pixelSize: 20
                    anchors.horizontalCenter : parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                TapHandler{
                    onTapped: console.log("aaa")

                    //begin()

                }
            }
            Button{
                id:_set
                width:180
                height:30
                background: Rectangle {
                    border.color: "#888"
                    border.width: 2
                    radius: 50
                    color: set.hovered ? "lightgreen" : "lightblue"
                }
                Text {
                    text: qsTr("About set")
                    font.pixelSize: 20
                    anchors.horizontalCenter : parent.horizontalCenter
                    anchors.verticalCenter: parent.verticalCenter
                }
                TapHandler{
                    onTapped: console.log("begin was clicked")
                    //gesturePolicy: TapHandler.ReleaseWithinBounds
                }
            }
            Button{
                 id: _quit
                width:180
                height:30
                background: Rectangle {
                    border.color: "#888"
                    border.width: 2
                    radius: 50
                    color: quit.hovered ? "lightgreen" : "lightblue"

                }
                Text {
                    text: qsTr("Close the game")//可以加成米塔那种鼠标移到上面笑脸变哭脸
                font.pixelSize: 20
                anchors.horizontalCenter : parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
            }
            TapHandler{
                onTapped: console.log("the game ended")
                //gesturePolicy: TapHandler.ReleaseWithinBounds
                //quit()
            }
        }
        }
    }
