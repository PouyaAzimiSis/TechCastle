import QtQuick 2.15
import QtQuick.Window 2.12

import "P_SplashScreen"
import "P_MainWindow"

QtObject {


    property var p_MainWindow: P_MainWindow {
       id: id_p_mainWindow
    }
    property var p_splashScreen: P_SplashScreen{
        onClosed: {
            id_p_mainWindow.x = x;
            id_p_mainWindow.y = y;
            id_p_mainWindow.width = width;
            id_p_mainWindow.height = hieght;
            id_p_mainWindow.visible = true;
        }

    }


}
