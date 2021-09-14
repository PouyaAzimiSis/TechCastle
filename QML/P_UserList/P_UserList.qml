import QtQuick 2.0
import "../Components"
import "../"
Item{

    C_RectangleWithShadow {
        anchors.top: parent.top
        width: parent.width
        height: 40
        radius: 0
        color: "#e3e8e5"

    }

    C_RectangleWithShadow {
        anchors.fill: parent
        anchors.rightMargin: 35
        anchors.leftMargin: 35
        anchors.topMargin: 90
        anchors.bottomMargin:  40
        radius: 10
        color: "#eff6f2"

    }
}


