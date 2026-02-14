#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext> // Add this!
#include "./Controllers/CalcController.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // Note: The name inside setDesktopFileName must match the filename of your desktop file (without the .desktop extension).
    app.setDesktopFileName("qtqmlprojcalc");

    CalcController controller; // Create the instance
    QQmlApplicationEngine engine;

    engine.rootContext()->setContextProperty("calcObj", &controller);

    using namespace Qt::StringLiterals; // Add this line!
    const QUrl url(u"qrc:/QtQMLProjCalc/Main.qml"_s); // Change _qs to _s

    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("QtQMLProjCalc", "Main");

    return app.exec();
}
