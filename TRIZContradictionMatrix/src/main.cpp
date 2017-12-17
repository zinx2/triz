#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "display_information.h"

int main(int argc, char *argv[])
{
//    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    DisplayInfo dpInfo;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("di", &dpInfo);
    engine.load(QUrl(QLatin1String("qrc:/qml/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
