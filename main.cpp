#include <QGuiApplication>
#include <QQmlApplicationEngine>

#include "player.h"
int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    qmlRegisterType<CustomPlayer>("com.customobjects", 1, 0, "CustomPlayer");
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));

    return app.exec();
}
