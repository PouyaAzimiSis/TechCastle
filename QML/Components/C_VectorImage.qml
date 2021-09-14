import QtQuick 2.0
import QtGraphicalEffects 1.0
Item {
    property alias source: id_fingerPrint.source
    property alias color: id_overlayColor.color
    Image {
        id: id_fingerPrint
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        sourceSize.width: width
        sourceSize.height: height
    }
    ColorOverlay {
        id: id_overlayColor
        anchors.fill: id_fingerPrint
        source: id_fingerPrint
    }
}

