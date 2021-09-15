import QtQuick 2.0
import QtQuick.Layouts 1.12
import "../"
Item {
    id: root
    property string title: "-"
    property alias inputText: nickname.text
    property bool isProtected: false

    Layout.fillWidth: true
    Layout.fillHeight: true
    Text{
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        width: parent.width
        anchors.top: parent.top
        height: 30
        color:"#008a8a"
        font: Style.fontTextHint
        text: root.title
    }

    C_PouyaField {
        id: nickname
        width: parent.width
        anchors.bottom: parent.bottom
        height: 40
        isProtected: root.isProtected

    }
}
