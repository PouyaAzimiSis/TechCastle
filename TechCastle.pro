QT += quick

CONFIG += c++11

SOURCES += \
        main.cpp

#comment resorces for faste compile nad execute in development stage
RESOURCES += qml.qrc

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

DISTFILES += \
    QML/P_MainWindow/P_MainWindow.qml \
    QML/P_SplashScreen/SplashScreen.qml \
    QML/qmldir
