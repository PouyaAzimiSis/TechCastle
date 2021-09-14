import QtQuick 2.0
import "../"
Item {
    id:root
    property alias color: id_underLine.color
    property string text: id_textInput.text
    property var hintText: "&!"
    property var isProtected: false
    onIsProtectedChanged: {
        if(isProtected){
            id_textInput.echoMode = TextInput.Password
        }
        else{
            id_textInput.echoMode = TextInput.Normal
        }
    }

    height: 40
    Rectangle {

        radius: 5
        id: id_underLine
        color: "black"
        height: 2
        anchors.bottom: parent.bottom
        width: parent.width
        Behavior on color {ColorAnimation{duration: 400}}
    }



    Text{
        id: id_hint
        font: Style.fontTextHint
        width: parent.width
        color: "#808080"
        text: root.hintText
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 3
        horizontalAlignment: Text.AlignHCenter
        Behavior on opacity {NumberAnimation{duration: 300}}

    }
    TextInput{
        id: id_textInput
        width: parent.width
        height: parent.height
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 3
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: TextInput.AlignBottom
        font: Style.fontText
        color: "#406940"

        onActiveFocusChanged:  {
            if(activeFocus){
                id_hint.opacity = 0;
                id_underLine.color = Style.secondaryColor
            }
            else{
                let lenthOfText = id_textInput.text.length
                if(lenthOfText === 0){
                    id_hint.opacity = 1;
                }
            }



        }


    }

}
