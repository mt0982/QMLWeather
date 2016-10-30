import QtQuick 2.0
import "script/weather.js" as Weather
import "chart"

Item {

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
        color: "#e64a3c"
    }

    Text {
        y: 15
        text: cityName + ", " + countryName
        font.family: "BahamasLight"
        font.pointSize: 24
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#ffffff"
    }

    CustomChart {
        id: pressureChart
        y: parent.height - (parent.height * 0.5)
        width: parent.width
        height: parent.height
    }
}
