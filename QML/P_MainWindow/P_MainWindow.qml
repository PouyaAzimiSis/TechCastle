import QtQuick 2.12
import QtQuick.Controls 1.2

ApplicationWindow  {

    width: 500
    height: 500
    visible: false
    title: "Tech Castle"

    Loader{
        id: id_loader
        anchors.fill: parent
        onLoaded: {
            console.log("Loaded")
        }
    }

    Component.onCompleted: {
        id_loader.source= "../C_StackOfPages/C_StackOfPages.qml"
    }
}
