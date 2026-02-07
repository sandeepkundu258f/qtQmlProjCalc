#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // Note: The name inside setDesktopFileName must match the filename of your desktop file (without the .desktop extension).
    app.setDesktopFileName("qtqmlprojcalc");

    QQmlApplicationEngine engine;
    QObject::connect(
        &engine,
        &QQmlApplicationEngine::objectCreationFailed,
        &app,
        []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.loadFromModule("QtQMLProjCalc", "Main");

    return app.exec();
}
