import QtQuick 2.0
import QtGraphicalEffects 1.0
import "script/weather.js" as Weather
import "chart"

Item {
    id: content

    function inc() { content.scale = 1.0 }
    function dec() { content.scale = 0.9 }

    Behavior on scale { NumberAnimation { duration: 2000 } }

    /* Properties */
    property string cityName: "-------"
    property string countryName: "--------"

    function clear() { pressureChart.clear() }
    function append(x,y) { pressureChart.append(x,y) }
    function xAxisRange(min,max) { pressureChart.xAxisRange(min,max) }
    function yAxisRange(min,max) { pressureChart.yAxisRange(min,max) }

    Component.onCompleted: {
        Weather.setCityName("Lublin")
        Weather.parseJSONForecast()
    }

    Rectangle {
        anchors.fill: parent
        color: "#86BA7C"
    }

    Text {
        id: title
        y: 15
        text: cityName + ", " + countryName
        font.family: "BahamasLight"
        font.pointSize: 24
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#ffffff"
    }

    /* Page Logo */
    Image {
        id: logo
        source: "qrc:/image/pressure.png"
        fillMode: Image.PreserveAspectFit
        anchors.top: title.bottom
        anchors.topMargin: 30
        anchors.horizontalCenter: parent.horizontalCenter
        smooth: true
        visible: false
    }

    DropShadow {
        anchors.fill: logo
        horizontalOffset: 3
        verticalOffset: 3
        radius: 8.0
        samples: 17
        color: "#80000000"
        source: logo
    }

    CustomChart {
        id: pressureChart
        y: parent.height - (parent.height * 0.5)
        width: parent.width
        height: parent.height
    }
}
