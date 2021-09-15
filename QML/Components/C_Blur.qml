import QtQuick 2.0
import QtGraphicalEffects 1.0

FastBlur{
    id: root

    property var target;
    property string color: "#3d1801"

    source: target
    radius: 40
    visible: false
    anchors.fill: target
    opacity: 0
    onOpacityChanged: {
        if(!opacity){
            visible = false;
        }
    }

    onVisibleChanged: {
        if(visible){
            root.opacity =1
        }


    }
    Behavior on opacity {
        NumberAnimation{duration: 300}
    }

    Rectangle{
        id: darkLayer
        anchors.fill: parent

        color: root.color
        opacity: 0.2


    }
    MouseArea{
        anchors.fill: parent
        hoverEnabled: true
    }
}
