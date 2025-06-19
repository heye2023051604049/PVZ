import QtQuick 2

Item {
    id: sunBank

    width: 60
    height: 40

    property int sunCount: 0
    property int maxSunCount: 9999
    property bool autoGenerate: true  // 是否自动生成阳光
    property int generateInterval: 5000  // 生成间隔(毫秒)
    property int generateAmount: 1  // 每次生成数量
    property var generateArea: parent  // 生成区域

    //存储阳光最大值
    onSunCountChanged: {
        if(sunCount > maxSunCount) {
            sunCount = maxSunCount
        }
    }


    // 阳光图标
    Image {
        id: sunIcon
        anchors {
            left: parent.left
            leftMargin: 10
            verticalCenter: parent.verticalCenter
        }
        source: "../assets/sun1.png"
        width: 40
        height: 40
    }

    // 阳光数量显示
    Text {
        id: sunText
        anchors {
            left: sunIcon.right
            leftMargin: 10
            verticalCenter: parent.verticalCenter
        }
        text: sunCount
        font.pixelSize: 24
        font.bold: true
        color: "#FFD700"  // 金色文字
        style: Text.Outline
        styleColor: "#8B4513"  // 棕色描边

        Behavior on text {
            NumberAnimation {
                duration: 100
            }
        }
    }

    // 阳光收集动画效果
    function playCollectAnimation(x, y) {
        var sun = sunComponent.createObject(sunBank.parent, {
            startX: x,
            startY: y,
            endX: sunBank.x + sunIcon.x + sunIcon.width/2,
            endY: sunBank.y + sunIcon.y + sunIcon.height/2
        });
        sun.collected.connect(function() {
            sunCount += 25;  // 每个阳光值25
            sun.destroy();
        });
    }

    // 单个阳光组件
    Component {
        id: sunComponent

        Item {
            id: sunInstance
            property real startX: 0
            property real startY: 0
            property real endX: 0
            property real endY: 0
            signal collected()

            x: startX
            y: startY
            width: 30
            height: 30

            Image {
                anchors.fill: parent
                source: "../assets/sun1.png"
                rotation: parent.rotation
            }

            // 阳光旋转动画
            RotationAnimation on rotation {
                from: 0
                to: 360
                duration: 5000
                loops: Animation.Infinite
                running: true
            }

            // 阳光下落动画
            ParallelAnimation {
                id: fallAnimation
                running: true

                NumberAnimation {
                    target: sunInstance
                    property: "y"
                    from: startY
                    to: startY + 150
                    duration: 1500
                    easing.type: Easing.OutQuad
                }

                SequentialAnimation {
                    NumberAnimation {
                        target: sunInstance
                        property: "x"
                        from: startX
                        to: startX + (Math.random() * 60 - 30)
                        duration: 750
                    }
                    NumberAnimation {
                        target: sunInstance
                        property: "x"
                        to: startX
                        duration: 750
                    }
                }

                onFinished: {
                    // 下落完成后可点击收集
                    mouseArea.enabled = true
                }
            }

            // 点击收集阳光
            MouseArea {
                id: mouseArea
                anchors.fill: parent
                enabled: false
                onClicked: {
                    collectAnimation.start()
                }
            }

            // 收集动画
            ParallelAnimation {
                id: collectAnimation

                NumberAnimation {
                    target: sunInstance
                    property: "x"
                    to: endX
                    duration: 300
                    easing.type: Easing.InQuad
                }

                NumberAnimation {
                    target: sunInstance
                    property: "y"
                    to: endY
                    duration: 300
                    easing.type: Easing.InQuad
                }

                NumberAnimation {
                    target: sunInstance
                    property: "opacity"
                    from: 1.0
                    to: 0.0
                    duration: 300
                }

                onFinished: {
                    collected()
                }
            }
        }
    }
    // 随机生成阳光
    function generateRandomSuns() {
        for (var i = 0; i < generateAmount; i++) {
            // 在生成区域内随机位置
            var x = Math.random() * (generateArea.width - 30)
            var y = -30  // 从屏幕上方开始

            // 创建阳光实例
            var sun = sunComponent.createObject(generateArea, {
                startX: x,
                startY: y,
                endX: sunBank.x + sunIcon.x + sunIcon.width/2,
                endY: sunBank.y + sunIcon.y + sunIcon.height/2,
            });
            sun.collected.connect(function() {
                sunCount += 25;  // 每个阳光值25
                sun.destroy();
            });
        }
    }
}
