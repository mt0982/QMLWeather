import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.0
import "script/weather.js" as Weather

ApplicationWindow {
    visible: true
    width: 269
    height: 480
    title: qsTr("Weather")

    Material.background: Material.BlueGrey
    Material.accent: "white"
    FontLoader { id: fixedFont; name: "AvantGarde LT ExtraLight" }

    Component.onCompleted: {
        swipeView.itemAt(0).inc()
        swipeView.itemAt(1).dec()
        Weather.setCityName("Lublin")
        Weather.parseJSON()
        console.log(Qt.fontFamilies())
    }

    SwipeView {
        id: swipeView
        currentIndex: 0
        anchors.fill: parent

        Page1 { id: oneDayForecast }
        Page2 { id: temperaturePage }
        Page3 { id: cloudsPage }
        Page4 { id: pressurePage }
        Page5 { id: windPage}

        onCurrentItemChanged: {
            currentItem.inc();

            for(var index = 0; index < swipeView.count; index++) {
                if(swipeView.itemAt(index) !== currentItem) swipeView.itemAt(index).dec();
            }
        }
    }

    DropShadow {
        anchors.fill: swipeView
        radius: 12.0
        samples: 17
        color: "#80000000"
        source: swipeView
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

    Page0 { anchors.fill: parent }
}




















