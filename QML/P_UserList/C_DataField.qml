import QtQuick 2.0
import "../"
Item{
    height: parent.height
    property alias text: id_text.text
    property bool makeGreen: false

    Text{
        id:id_text
        anchors.fill: parent
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        font: Style.fontTextHint
        color: {
            if(makeGreen){
                return "#3e8740"

            }
            else{
                return "#505550"
            }
        }

    }

}

