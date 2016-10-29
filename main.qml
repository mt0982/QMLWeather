import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import "script/weather.js" as Weather

ApplicationWindow {
    visible: true
    width: 269
    height: 480
    title: qsTr("Weather")

    SwipeView {
        id: swipeView
        currentIndex: 0
        anchors.fill: parent

        PageOneDay {
            id: oneDayForecast
        }

        Page2Test {

        }
    }

    PageIndicator {
        id: indicator
        count: swipeView.count
        currentIndex: swipeView.currentIndex
        anchors.bottom: swipeView.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        delegate: Rectangle {
            implicitWidth: 8
            implicitHeight: 8
            radius: width / 2
            color: "white"
            opacity: index === swipeView.currentIndex ? 0.95 : pressed ? 0.7 : 0.45
            Behavior on opacity { OpacityAnimator { duration: 100 } }
        }
    }

    Button {
        width: 64
        height: 64
        //anchors.centerIn: parent
        onClicked: Weather.parseJSON()
    }

//    Timer {
//        interval: 5000
//        running: true
//        repeat: true
//        onTriggered: console.log("A")
//    }
}




















