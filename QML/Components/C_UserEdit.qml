import QtQuick 2.0
import QtQuick.Layouts 1.12
import "../"
Rectangle {
    id:root
    property var userId

    visible: false
    radius: 5
    opacity: 0
    border.color: "#ff914d"
    color: "#fffefd"
    border.width: 1


    onVisibleChanged: {
        if(visible){
            opacity = 0.95
        }
    }
    Behavior on opacity {
        NumberAnimation{duration: 300}
    }

    Text {
        id: id_head
        width: parent.width
        anchors.top: parent.top
        height: 80
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        text: "Edit User Info";
        font: Style.fontTitle
        color:"#008a8a"
    }

    GridLayout {
        anchors.top: id_head.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.leftMargin: 35
        anchors.rightMargin: 35
        anchors.topMargin: 18
        height: 220
        columns: 2
        rows: 3
        rowSpacing: 35
        columnSpacing: 46
        C_EditableField {
            id: id_name
            title: "Name"
            inputText: "5456456"

        }
        C_EditableField {
            id: id_language_id
            title: "Language ID"
        }
        C_EditableField {
            id: id_status
            title: "Status"
        }
        C_EditableField {
            id: id_user_level
            title: "Level"
        }
        C_EditableField {
            id: id_min_bet
            title: "Min Bet"
        }
        C_EditableField {
            id: id_max_bet
            title: "Max bet"
        }

        Connections {
            target: StateManager
            onOpenUserEditWindow: function(userInfo){
                console.log("##"+userInfo.name)
                root.userId = userInfo.id
                id_name.inputText = userInfo.name
                id_language_id.inputText = userInfo.language_id
                id_status.inputText = userInfo.status
                id_user_level.inputText = userInfo.user_level
                id_min_bet.inputText = userInfo.min_bet
                id_max_bet.inputText = userInfo.max_bet
            }
        }
    }


}
