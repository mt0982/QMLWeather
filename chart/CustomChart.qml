import QtQuick 2.0
import QtCharts 2.1

Item {

    function clear() { series.clear() }
    function append(x,y) { series.append(x,y) }
    function xAxisRange(min,max) { xAxis.min = min; xAxis.max = max }
    function yAxisRange(min,max) { yAxis.min = min; yAxis.max = max }

    /* Chart Flickable Area */
    Flickable {
        interactive: true
        width: parent.width
        height: parent.height
        contentWidth: parent.width * 5.0
        contentHeight: parent.height
        boundsBehavior: Flickable.StopAtBounds

        ChartView {
            id: chart
            height: parent.height * 0.5 //anchors.fill: parent
            width: parent.width
            antialiasing: true
            //theme: ChartView.ChartThemeQt
            legend.visible: false
            margins.bottom: 0
            margins.left: 0
            margins.right: 0
            margins.top: 0
            backgroundColor: "transparent"

            SplineSeries {
                id: series
                name: "Temperature"
                pointsVisible: true
                color: "white"

                axisX: DateTimeAxis {
                    id: xAxis
                    format: "MM.dd"// hh.mm"
                    tickCount: 5
                    gridVisible: false
                    //labelsVisible: false
                    lineVisible: false
                    //visible: false
                    labelsColor: "white"
                }

                axisY: ValueAxis {
                    id: yAxis;
                    tickCount: 5
                    gridVisible: false
                    //labelsVisible: false
                    lineVisible: false
                    //visible: false
                    labelsColor: "white"
                }
            }
        }
    }
}












