#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QIcon>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    app.setWindowIcon(QIcon(":QML/resources/AppIcon.png"));

    QQmlApplicationEngine engine;

//    For faster compile we use relative path and disabled qml.qrc in .pro file
//    const QUrl url(QStringLiteral("../TechCastle/QML/main.qml"));

//    For Release Use this qrc Path and enable qml.qrc in .pro file
    const QUrl url(QStringLiteral("qrc:/QML/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
