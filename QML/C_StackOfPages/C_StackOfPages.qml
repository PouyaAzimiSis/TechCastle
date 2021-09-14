import QtQuick 2.0
import QtQuick.Layouts 1.12
import QtQuick.Controls 2.12

import "../"
import "../P_LoginPage"
import "../P_UserList"

Item {
    Image{
        anchors.fill: parent
        source: "../"+Style.pathBackGroundLoginPage
        fillMode:  Image.Tile
        z:0
    }

    StackView  {
        id: stack
        anchors.fill: parent
        initialItem: id_loginPage

        pushEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 500
            }
        }
        pushExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 500
            }
        }
        popEnter: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 0
                to:1
                duration: 500
            }
        }
        popExit: Transition {
            PropertyAnimation {
                property: "opacity"
                from: 1
                to:0
                duration: 500
            }
        }

    }
    Component{
        id:id_loginPage
        P_LoginPage {
        }
    }

    Component{
        id:id_userPage
        P_UserList {
        }
    }



    Connections{
        target: StateManager
        onLoginResponse: {
            if(isConfirmed){
                stack.pop();
                stack.push(id_userPage)
            }
        }

        onUserListUpdated:{

        }
    }
}
