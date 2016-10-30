import QtQuick 2.0
import QtQuick.Layouts 1.1
import QtGraphicalEffects 1.0
import QtQuick.Controls 2.0
import "gesture" as Gesture
import "script/weather.js" as Weather

Item {
    id: content

    /* Properties */
    property string cityName: "-------"
    property string countryName: "--------"
    property real cityTemperature: -99
    property real cityHumidity: -99
    property real cityCloudiness: -99
    property real cityLatitude: -99
    property real cityLongitude: -99
    property real cityPressure: -99
    property real cityWindSpeed: -99
    property string weathericon: ""

    /* Content */
    Image {
        id: background
        source: "qrc:/image/autumn.jpg"
        anchors.fill: parent
        fillMode: Image.PreserveAspectCrop
    }

    /* Title */
    Text {
        id: city
        text: cityName + ","
        font.family: "AvantGarde LT ExtraLight"
        font.bold: true
        font.pointSize: 22
        x: 10
        y: 10
        color: "white"
    }

    /* Country */
    Text {
        id: country
        text: countryName
        font.family: "AvantGarde LT ExtraLight"
        font.pointSize: 22
        anchors.left: city.right
        anchors.leftMargin: 5
        anchors.verticalCenter: city.verticalCenter
        color: "white"
    }

    /* Temperature | Lat | Lon */
    RowLayout {
        id: layout
        anchors.top: city.bottom
        anchors.left: city.left
        //width: parent.width

        Text {
            id: temperature
            text: cityTemperature.toFixed(2) + "°"
            font.family: "AvantGarde LT ExtraLight"
            font.pointSize: 28
            color: "white"
        }

        ColumnLayout {
            //anchors.left: parent.right
            Text { text: "H  " + cityLatitude; font.family: "AvantGarde LT ExtraLight"; color: "white"; font.bold: true }
            Text { text: "L  " + cityLongitude; font.family: "AvantGarde LT ExtraLight"; color: "white"; font.bold: true }
        }
    }

    /* Description */
    Text {
        id: description
        text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco l"
        wrapMode: Text.Wrap
        font.family: "AvantGarde LT ExtraLight"
        horizontalAlignment: Text.AlignJustify
        font.pointSize: 11
        color: "white"
        anchors.top: layout.bottom
        anchors.left: city.left
        anchors.right: parent.right
        anchors.rightMargin: 10
    }

    /* Humidity | Cloudiness */
    RowLayout {
        id: firstRow
        anchors.top: description.bottom
        anchors.left: city.left
        anchors.topMargin: 10

        Text {
            text: "Humidity \n" + cityHumidity + "%"
            font.family: "AvantGarde LT ExtraLight"
            font.pointSize: 12
            font.bold: true
            color: "white"
        }

        Text {
            Layout.leftMargin: 28
            text: "Cloudiness \n" + cityCloudiness + "%"
            font.family: "AvantGarde LT ExtraLight"
            font.pointSize: 12
            font.bold: true
            color: "white"
        }
    }

    /* Wind | Pressure */
    RowLayout {
        anchors.top: firstRow.bottom
        anchors.left: city.left
        anchors.topMargin: 10

        Text {
            text: "Wind Speed \n" + (cityWindSpeed * 3.6).toFixed(2) + " km/h"
            font.family: "AvantGarde LT ExtraLight"
            font.pointSize: 12
            font.bold: true
            color: "white"
        }

        Text {
            text: "Pressure \n" + cityPressure + " hpa"
            font.family: "AvantGarde LT ExtraLight"
            font.pointSize: 12
            font.bold: true
            color: "white"
        }
    }

    /* Weather Icon */
    Image {
        id: wico
        source: weathericon
        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
        visible: false
    }

    DropShadow {
          anchors.fill: wico
          horizontalOffset: 3
          verticalOffset: 3
          radius: 8.0
          samples: 17
          color: "black"
          source: wico
      }

    /* Busy Indicator */
    BusyIndicator {
        id: busyIndicator
        anchors.right: parent.right
        anchors.rightMargin: 10
        anchors.top: parent.top
        anchors.topMargin: 10
        width: 32
        height: 32
        opacity: 0.0

        Behavior on opacity { NumberAnimation { duration: 2000 } }
    }

    /* Refresh By Double Tap */
    MouseArea {
        anchors.fill: parent
        onDoubleClicked: {
            timer.start()
            busyIndicator.opacity = 1.0
            console.log("\nUpdated")
            Weather.setCityName(cityName)
            Weather.parseJSON()
        }
    }

    Timer {
        id: timer
        interval: 5000
        running: true
        onTriggered: {
            console.log("Refresh time: " + new Date())
            busyIndicator.opacity = 0.0
        }
    }

    /* Serch Field */
    Drawer {
        id: drawer
        width: parent.width
        edge: Qt.TopEdge
        height: 40

        RowLayout {
            anchors.fill: parent

            TextField {
                id: fieldCityName
                placeholderText: qsTr("City name")
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.right: btnSearch.left
            }

            ToolButton {
                id: btnSearch
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.verticalCenter: parent.verticalCenter
                implicitHeight: 35
                implicitWidth: 35
                onClicked: {
                    Weather.setCityName(fieldCityName.text)
                    Weather.parseJSON()
                    Weather.parseJSONForecast()
                }

                Image {
                    anchors.fill: parent
                    source: "qrc:/image/search.png"
                }
            }
        }
    }

    transform: Translate {
        y: drawer.position * drawer.height
    }

    Gesture.Swipe {
        width: parent.width
        height: 100
    }
}



















