import QtQuick 2.12
import QtQuick.Controls 2.12
import "../Components"
import "../"
Item{
    id: root
    C_RectangleWithShadow {
        anchors.top: parent.top
        width: parent.width
        height: 55
        radius: 0
        color: "#D3D8D5"
        Text {
            height: parent.height
            width: 200
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            id: name
            text: StateManager.lastEmail
            color: "#008299"
            font: Style.fontTitle

        }

        C_Button{
            width: 200
            height: 37
            anchors.verticalCenter: parent.verticalCenter
            text: "Update Users List"
            anchors.right: parent.right
            anchors.rightMargin: 40
            mainColor: Style.secondaryColor
            hoverColor: Style.secondaryColorDarker
            onClicked: {
                StateManager.requestUsersList();
            }
        }
        C_Button{
            width: 130
            height: 37
            anchors.verticalCenter: parent.verticalCenter
            text: "Log Out"
            anchors.left: parent.left
            anchors.leftMargin: 40
            mainColor: "#de4e4e"
            hoverColor: "#c74242"
            onClicked: {
                StateManager.requestLogOut();
            }
        }

    }

    C_RectangleWithShadow {
        anchors.fill: parent
        anchors.rightMargin: 35
        anchors.leftMargin: 35
        anchors.topMargin: 90
        anchors.bottomMargin:  40
        radius: 10
        color: "#eff6f2"

        Flickable {
            anchors.fill: parent
            anchors.rightMargin: 4
            anchors.leftMargin: 4
            onWidthChanged: {
                if(width>990){
                    contentWidth = parent.width
                }
                else{
                    contentWidth = 990;
                }
            }

            contentWidth: 990
            contentHeight: parent.height
            flickableDirection: Flickable.HorizontalFlick
            boundsBehavior: Flickable.StopAtBounds
            ScrollIndicator.horizontal: ScrollIndicator { }
            clip: true


            C_Titles{
                id:id_titels
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.rightMargin: 10
                anchors.leftMargin: 10
                height: 25
            }
            C_TableUsers{
                id:tableUsers
                anchors.right: parent.right
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.top: id_titels.bottom
                anchors.topMargin: 10
                anchors.rightMargin: 10
                anchors.leftMargin: 10
            }
        }



    }



}


