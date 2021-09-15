import QtQuick 2.12
import QtQuick.Layouts 1.12
import "../"
Rectangle {
    id: root
    radius: 5
    color: "#e6f0ea"
    property var userData
    property var indexOfDelegate
    onIndexOfDelegateChanged: {
        if(indexOfDelegate%2==0){
            root.color = "#e4ebe6"
        }
        else{
            root.color = "#e6f0ea"
        }
    }

    onUserDataChanged: {
        id_id.text = userData.id
        id_name.text = userData.name
        id_nickname.text = userData.nickname
        id_email.text = userData.email
        id_status.text = userData.status
        id_minbet.text = userData.min_bet
        id_maxbet.text = userData.max_bet
        id_level.text = userData.level
        id_verif.text = userData.verification
        id_lang.text = userData.language_id

    }



    RowLayout {
        anchors.fill: parent
        clip: true
        C_EditIcon {
            Layout.preferredWidth: 60
            height: root.height
            onClicked: {
                let usreInfo = {
                    "id": userData.id,
                    "name" : userData.name,
                    "language_id": userData.language_id,
                    "status": userData.status,
                    "min_bet": userData.min_bet,
                    "max_bet": userData.max_bet,
                    "user_level": userData.level,

                }

                StateManager.openUserEditWindow(usreInfo);
            }
        }


        C_DataField{
            id: id_id
            Layout.preferredWidth: 60

        }
        C_DataField{
            id: id_name
            Layout.minimumWidth: 90
            Layout.preferredWidth: 110
            Layout.fillWidth: true
        }
        C_DataField{
            id: id_nickname
            Layout.minimumWidth: 90
            Layout.preferredWidth: 110
            Layout.fillWidth: true
        }
        C_DataField{
            id: id_email
            Layout.minimumWidth: 150
            Layout.preferredWidth: 230
            Layout.fillWidth: true
        }
        C_DataField{
            id: id_status
            makeGreen: true
            Layout.minimumWidth: 80
            Layout.maximumWidth: 110

            Layout.fillWidth: true
        }
        C_DataField{
            id: id_minbet
            Layout.minimumWidth: 80
            Layout.maximumWidth: 110
            Layout.fillWidth: true
        }
        C_DataField{
            id: id_maxbet
            Layout.minimumWidth: 80
            Layout.maximumWidth: 110
            Layout.fillWidth: true
        }
        C_DataField{
            id: id_level
            makeGreen: true;
            Layout.minimumWidth: 80
            Layout.maximumWidth: 100
            Layout.fillWidth: true
        }
        C_DataField{
            id: id_verif
            makeGreen: true;
            Layout.minimumWidth: 100
            Layout.maximumWidth: 120
            Layout.fillWidth: true
        }
        C_DataField{
            id: id_lang
            Layout.minimumWidth: 100
            Layout.maximumWidth: 120
            Layout.fillWidth: true
        }
    }
}



