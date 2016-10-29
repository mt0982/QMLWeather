import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import "script/weather.js" as Weather

ApplicationWindow {
    visible: true
    width: 640
    height: 480
    title: qsTr("Weather")

    Button {
        width: 64
        height: 64
        anchors.centerIn: parent
        onClicked: Weather.getData()
    }
}
