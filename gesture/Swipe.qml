import QtQuick 2.0

Item {

    MouseArea {
        id: globalMouseArea
        anchors.fill: parent
        preventStealing: true
        property real velocity: 0.0
        property int yStart: 0
        property int yPrev: 0
        property bool tracing: false

        onPressed: {
            yStart = mouse.y
            yPrev = mouse.y
            velocity = 0
            tracing = true
        }

        onPositionChanged: {
            if ( !tracing ) return
            var currVel = (mouse.y - yPrev)
            velocity = (velocity + currVel)/2.0
            yPrev = mouse.y
            if ( velocity > 2.0 && mouse.y > parent.height * 0.2 ) {
                tracing = false
                drawer.open()
            }
        }

        onReleased: {
            tracing = false
            if ( velocity > 2.0 && mouse.y > parent.height * 0.2 ) {

            }
        }
    }
}
