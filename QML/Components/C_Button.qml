import QtQuick 2.0
import "../"
Rectangle {
    id: root
    radius: 6
    signal clicked();

    property alias text: id_text.text
    property var mainColor: "red"
    property var hoverColor: "red"
    property var disableColor: "red"
    property var isDisabled: false
    onIsDisabledChanged: {
        root.color = disableColor
    }

    Behavior on color{ColorAnimation{duration: 200}}

    MouseArea{
        anchors.fill: parent
        onClicked: root.clicked()

        hoverEnabled: true
        onHoveredChanged: {
            if(!isDisabled){
                if(containsMouse){
                    root.color = root.hoverColor
                }
                else {
                    root.color = root.mainColor
                }
            }
        }
    }
    Component.onCompleted: color = mainColor


    Text {
        id: id_text
        font: Style.fontButton
        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        color: Style.mainColor
    }
}
