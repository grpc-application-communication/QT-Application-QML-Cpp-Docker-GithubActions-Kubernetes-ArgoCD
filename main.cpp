#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include "FileWatcher.h"  // Include your VehicleDataMonitor class

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    // Create an engine instance
    QQmlApplicationEngine engine;

    // Create an instance of the VehicleDataMonitor
    VehicleDataMonitor vehicleDataMonitor;

    // Expose the VehicleDataMonitor instance to QML
    engine.rootContext()->setContextProperty("vehicleDataMonitor", &vehicleDataMonitor);

    // Connect the object to make sure it's properly created
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
                         if (!obj && url == objUrl)
                             QCoreApplication::exit(-1);
                     }, Qt::QueuedConnection);

    // Load the QML interface
    engine.load(url);

    // Start monitoring vehicle data
    vehicleDataMonitor.startMonitoring();

    return app.exec();
}
