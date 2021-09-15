import QtQuick 2.0
import "../"
Item{
    height: parent.height
    property alias text: id_text.text

//    color: "red"
    Text{
        id:id_text
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignBottom
        font: Style.fontTextHint
        color: "#848984"
    }

}
