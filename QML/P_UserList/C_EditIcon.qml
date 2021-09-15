import QtQuick 2.0
import QtGraphicalEffects 1.0
import "../"

Item{
    id: rootroot
    signal clicked();
    MouseArea{
        anchors.fill: parent
        onClicked: rootroot.clicked();
    }

    Rectangle {
        id: root
        radius: 7
        width: 46
        height: 20
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 0
        anchors.leftMargin: 4
        signal clicked();

        property alias text: id_text.text
        property string mainColor: "#de774e"
        property string hoverColor: "#ff4900"
        property string disableColor: "red"
        property bool isDisabled: false
        onIsDisabledChanged: {
            root.color = disableColor
        }

        Behavior on color{ColorAnimation{duration: 200}}

        MouseArea{
            anchors.fill: parent
            onClicked: root.clicked()

            hoverEnabled: true
            onHoveredChanged: {

                if(containsMouse){
                    root.color = root.hoverColor
                }
                else {
                    root.color = root.mainColor
                }

            }
        }
        Component.onCompleted: color = mainColor


        Text {
            id: id_text
            text: "Edit"
            font: Style.fontsSmall
            anchors.fill: parent
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            color: Style.mainColor
        }
    }
}



