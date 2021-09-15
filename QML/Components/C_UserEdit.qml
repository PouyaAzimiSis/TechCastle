import QtQuick 2.0
import QtQuick.Layouts 1.12
import "../"
Rectangle {
    id:root
    property var userId
    signal closeWithOutSaving();
    visible: false
    radius: 5
    opacity: 0
    border.color: "#ff914d"
    color: "#fffefd"
    border.width: 1

    onOpacityChanged: {
        if(opacity === 0){
            visible = false;
        }
    }

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
        id: id_gridLayout
        anchors.top: id_head.bottom
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.leftMargin: 35
        anchors.rightMargin: 35
        anchors.topMargin: 0
        height: 280
        columns: 2
        rows: 4
        rowSpacing: 35
        columnSpacing: 46
        C_EditableField {
            id: id_name
            title: "Name"
        }
        C_EditableField {
            id: id_nickname
            title: "Nickname"
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
                id_nickname.inputText = userInfo.nickname
            }
        }
    }
    ColumnLayout{
        anchors.top: id_gridLayout.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 30
        width: 200
        height: 100
        spacing: 10
        C_EditableField {
            id: id_passWord
            title: "New Password"
            isProtected: true
            inputText: ""
        }
        C_EditableField {
            id: id_passwordConfirm
            title: "New Password Confirmation"
            isProtected: true
            inputText: ""
        }
    }

    RowLayout{
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 22
        anchors.horizontalCenter: parent.horizontalCenter
        height: 45
        width: 370
        spacing: 25
        C_Button {
            Layout.fillHeight: true
            Layout.fillWidth: true
            text: "Cancel"
            mainColor: "#de4e4e"
            hoverColor: "#c74242"
            onClicked: closeWithOutSaving();
        }
        C_Button {
            Layout.fillHeight: true
            Layout.fillWidth: true
            mainColor: Style.secondaryColor
            hoverColor: Style.secondaryColorDarker
            text: "Apply Changes"
            onClicked: {
                let EditedData = {
                    "id": root.userId,
                    "name" : id_name.inputText,
                    "nickname": id_nickname.inputText,
                    "language_id": id_language_id.inputText,
                    "status": id_status.inputText,
                    "min_bet": id_min_bet.inputText,
                    "max_bet": id_max_bet.inputText,
                    "user_level": id_user_level.inputText,
                    "password" : id_passWord.inputText,
                    "password_confirmation" : id_passwordConfirm.inputText
                }


                console.log(EditedData.password)
                StateManager.requestEditUser(EditedData)
                closeWithOutSaving();
            }
        }
    }


}
