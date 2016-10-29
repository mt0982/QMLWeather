import QtQuick 2.0
import QtQuick.Layouts 1.1

Item {

    /* Properties */
    property string cityName: "Lublin,"
    property string countryName: "Poland"
    property real cityTemperature: -99
    property real cityHumidity: -99
    property real cityCloudiness: -99
    property real cityLatitude: -99
    property real cityLongitude: -99

    /* Content */
    Image {
        id: background
        source: "qrc:/image/rain.jpg"
    }

    /* Title */
    Text {
        id: city
        text: cityName
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
            text: cityTemperature + "°"
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
        horizontalAlignment: Text.AlignLeft
        font.family: "AvantGarde LT ExtraLight"
        font.pointSize: 11
        color: "white"
        anchors.top: layout.bottom
        anchors.left: city.left
        anchors.right: parent.right
        anchors.rightMargin: 10
    }

    /* Humidity | Cloudiness */
    RowLayout {
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
            text: "Cloudiness \n" + cityCloudiness + "%"
            font.family: "AvantGarde LT ExtraLight"
            font.pointSize: 12
            font.bold: true
            color: "white"
        }
    }
}
