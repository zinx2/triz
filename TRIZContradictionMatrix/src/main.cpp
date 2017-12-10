#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "screeninfo.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);
    ScreenInfo scrInfo;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("screen", &scrInfo);
    engine.load(QUrl(QLatin1String("qrc:/qml/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
