import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    property alias color: id_rectangle.color
    property alias radius: id_rectangle.radius

    Item{
        anchors.fill: parent
        Rectangle{
            id: id_rectangle
            anchors.fill: parent


        }
        DropShadow {
            anchors.fill: id_rectangle
            source: id_rectangle
            radius: 18
            samples: 35
            color: "#919191"


        }
    }


}
