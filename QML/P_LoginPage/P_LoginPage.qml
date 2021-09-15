import QtQuick 2.0

import "../"
import "../Components"

Item {

    function clearFields() {

        id_password.text = ""
    }

    C_RectangleWithShadow {
        width: 350
        height: 340
        radius: 5
        color: Style.mainColor
        anchors.centerIn: parent

        C_VectorImage {
            width: 100
            height: 100
            anchors.horizontalCenter:  parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 20
            opacity: 0.2
            color: "#809280"
            source: "./fingerPrint.svg"
        }


        C_PouyaField {
            id: id_userName
            width: 220
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#e0e0e0"
            anchors.bottom: id_password.top
            anchors.bottomMargin: 8
            hintText: "Email"
        }
        C_PouyaField {
            id:id_password
            width: 220
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#e0e0e0"
            anchors.bottom: id_signInButton.top
            anchors.bottomMargin: 40
            hintText: "Password"
            isProtected: true
        }

        C_Button{
            id: id_signInButton
            text: "Sing in"
            width: 220
            height: 45
            mainColor: Style.secondaryColor
            hoverColor: Style.secondaryColorDarker
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 20
            onClicked: {
                console.log("clicked")
                StateManager.sendLoginRequest(id_userName.text,id_password.text)
            }

        }
    }
}
