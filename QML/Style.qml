pragma Singleton
import QtQuick 2.12

QtObject {
    id:root
    property var mainColor
    property var secondaryColor
    property var secondaryColorDarker
    property var pathBackGroundLoginPage


    property var myfont: FontLoader {
        id: fixedFont;
        source: "./resources/fonts/Roboto/Roboto-Regular.ttf";
//        name:"Roboto"
    }
    property var fontTitle: Qt.font({
                                       family: fixedFont.name,
                                       weight: 56,
                                       italic: false,
                                       pointSize: 18
                                   })

    property var fontButton: Qt.font({
                                       family: fixedFont.name,
//                                       weight: Font.Black,
                                       italic: false,
                                       pointSize: 13
                                   })
    property var fontsSmall: Qt.font({
                                       family: fixedFont.name,
                                        weight: 50,
                                       italic: false,
                                       pointSize: 9
                                   })
    property var fontTextHint: Qt.font({
                                       family: fixedFont.name,
//                                       weight: Font.Black,
                                       italic: false,
                                       pointSize: 10
                                   })
    property var fontText: Qt.font({
                                       family: fixedFont.name,
//                                       weight: Font.Black,
                                       italic: false,
                                       pointSize: 11
                                   })


    function selectStyle(styleName){
        if(styleName === "Light"){
            root.mainColor = "#FcFfFc"
            root.secondaryColor = "#00AB3C"
            root.secondaryColorDarker = "#009132"
            root.pathBackGroundLoginPage = "resources/BackGroundLight.png"
        }
        else if(styleName === "Dark"){

        }
    }

    Component.onCompleted: selectStyle("Light");

}
