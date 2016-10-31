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

    function clear() { windChart.clear() }
    function append(x,y) { windChart.append(x,y) }
    function xAxisRange(min,max) { windChart.xAxisRange(min,max) }
    function yAxisRange(min,max) { windChart.yAxisRange(min,max) }

    Component.onCompleted: {
        Weather.setCityName("Lublin")
        Weather.parseJSONForecast()
    }

    Rectangle {
        anchors.fill: parent
        color: "#7C878F"
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
        source: "qrc:/image/wind.png"
        fillMode: Image.PreserveAspectFit
        y: parent.height * 0.25
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
        id: windChart
        y: parent.height - (parent.height * 0.5)
        width: parent.width
        height: parent.height
    }
}

