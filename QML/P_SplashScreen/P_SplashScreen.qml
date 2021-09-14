import QtQuick 2.15
import QtQuick.Window 2.12

Window {
    id: id_splash

    property int timeoutInterval: 2500

    signal closed(var x,var y,var width,var hieght);

    color: "transparent"
    title: "Splash Window"
    modality: Qt.ApplicationModal
    flags: Qt.SplashScreen
    x: (Screen.width - id_splash.width) / 2
    y: (Screen.height - id_splash.height) / 3.5
    width: 1000
    height: 700
    opacity: 0.75;

    NumberAnimation on opacity{
        id: id_closeAnimaiton
        duration: 700
        running: false
        to:0
        onFinished: {
            closed(id_splash.x,id_splash.y, id_splash.width, id_splash.height);
            id_splash.visible = false;
        }
    }

    Rectangle{
        anchors.centerIn: parent
        width: parent.width
        height: parent.height
        border.width: 2
        color:"#011E24"
        border.color: "#2EDEAF"
        radius: 20
        MouseArea {
            anchors.fill: parent
            onClicked: quitWithOpacity();
        }
        Image {

            id: id_splashImage
            source: "Splash_screen.jpg"
            fillMode: Image.Pad
            anchors.centerIn: parent

        }

    }

    Timer {
        interval: timeoutInterval; running: true; repeat: false
        onTriggered: {quitWithOpacity();}
    }

    Component.onCompleted: visible = true



    function quitWithOpacity(){
        id_closeAnimaiton.start();
    }
}
