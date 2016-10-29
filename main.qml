import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import "script/weather.js" as Weather

ApplicationWindow {
    visible: true
    width: 269
    height: 480
    title: qsTr("Weather")

    Image {
        id: background
        source: "qrc:/image/rain.jpg"
    }

    /* Title */
    Text {
        id: city
        text: qsTr("Lublin,")
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
        text: qsTr("Poland")
        font.family: "AvantGarde LT ExtraLight"
        font.pointSize: 22
        anchors.left: city.right
        anchors.leftMargin: 5
        anchors.verticalCenter: city.verticalCenter
        color: "white"
    }

    /* Temperature */
    RowLayout {
        id: layout
        anchors.top: city.bottom
        anchors.left: city.left
        //width: parent.width

        Text {
            id: temperature
            text: "24°"
            font.family: "AvantGarde LT ExtraLight"
            font.pointSize: 28
            color: "white"
        }

        ColumnLayout {
            //anchors.left: parent.right
            Text { text: "H 52.97"; font.family: "AvantGarde LT ExtraLight"; color: "white"; font.bold: true }
            Text { text: "L 48.23"; font.family: "AvantGarde LT ExtraLight"; color: "white"; font.bold: true }
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

//    Button {
//        width: 64
//        height: 64
//        //anchors.centerIn: parent
//        onClicked: Weather.getData()
//    }
}




















