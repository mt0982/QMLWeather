import QtQuick 2.0
import QtQuick.Extras 1.4
import QtQuick.Controls.Styles 1.4
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.0

//http://www.pshkvsky.com/category/gif2code/
//#0cc9c7
//Splash

Item {

    Rectangle {
        id: root
        anchors.fill: parent
        color: "#221e26"

        /* Title */
        Text {
            color: "#ffffff"
            text: qsTr("OpenWeatherMap")
            font.family: "BahamasLight"
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 22
            anchors.top: parent.top
            anchors.topMargin: 25
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Behavior on opacity { NumberAnimation { duration: 2000 } }

        AnimatedImage {
            id: animation
            source: "qrc:/image/splash.gif"
            anchors.centerIn: parent
            fillMode: AnimatedImage.PreserveAspectCrop
            width: parent.width * 0.5
            height: parent.width * 0.5
            visible: false
        }

        DropShadow {
            id: shadow
            anchors.fill: animation
            horizontalOffset: 0
            verticalOffset: 0
            radius: 27.0
            samples: 17
            color: "#80000000"
            source: animation

            Text {
                id: text
                color: "#ffffff"
                text: qsTr("Press \nAnd \nHold")
                font.family: "BahamasLight"
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: 16
                styleColor: "#ffffff"
                anchors.centerIn: parent

                SequentialAnimation {
                    running: true
                    loops: Animation.Infinite

                    NumberAnimation {
                        target: text
                        property: "opacity"
                        duration: 2000
                        from: 0.0
                        to: 1.0
                    }

                    NumberAnimation {
                        target: text
                        property: "opacity"
                        duration: 2000
                        from: 1.0
                        to: 0.0
                    }
                }
            }

            Behavior on scale { NumberAnimation { duration: 1000 } }

            MouseArea {
                anchors.fill: parent
                onPressed: {
                    timer.start()
                    shadow.scale = 0.8
                }
                onReleased: {
                    shadow.scale = 1.0
                    if(control.value < 1.0) {
                        control.value = 0.0
                        timer.stop()
                    }
                }
            }
        }

        ProgressBar {
            id: control
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 10
            anchors.leftMargin: 5
            anchors.rightMargin: 5

            background: Rectangle {
                implicitWidth: 200
                implicitHeight: 2
                x: control.leftPadding
                y: parent.height / 2 - height / 2
                color: "#990ccac7"
                radius: 2
            }

            contentItem: Item {
                implicitWidth: control.implicitWidth
                implicitHeight: control.implicitHeight

                Rectangle {
                    width: control.visualPosition * control.width
                    height: parent.height
                    radius: 2
                    color: "#0cc9c7"
                }
            }
        }
    }

    Timer {
        id: timer
        interval: 100
        repeat: true
        onTriggered: {
            if(control.value == 1.0) root.opacity = 0.0
            else if(control.value + 0.0325 <= 1.1) control.value += 0.0325
        }
    }
}
















