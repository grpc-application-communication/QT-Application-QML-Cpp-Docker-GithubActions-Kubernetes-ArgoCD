#include "FileWatcher.h"
#include <QJsonDocument>
#include <QJsonObject>
#include <QFile>
#include <QDebug>

VehicleDataMonitor::VehicleDataMonitor(QObject *parent)
    : QObject(parent),
    m_temperature(0),
    m_speed(0),
    m_fuelLevel(0),
    m_oilLevel(0),
    m_batteryLevel(0),
    m_tireLevel(0),
    m_timer(new QTimer(this))
{
    connect(m_timer, &QTimer::timeout, this, &VehicleDataMonitor::loadVehicleData);
}

float VehicleDataMonitor::temperature() const
{
    return m_temperature;
}

float VehicleDataMonitor::speed() const
{
    return m_speed;
}

float VehicleDataMonitor::fuelLevel() const
{
    return m_fuelLevel;
}

float VehicleDataMonitor::oilLevel() const
{
    return m_oilLevel;
}

float VehicleDataMonitor::batteryLevel() const
{
    return m_batteryLevel;
}

float VehicleDataMonitor::tireLevel() const
{
    return m_tireLevel;
}

void VehicleDataMonitor::loadVehicleData()
{
    QFile file("/home/farah/QT_APP_QML/assets/values.json");  // Assuming the file is in resources
    if (!file.open(QIODevice::ReadOnly)) {
        qWarning() << "Failed to open file:" << file.errorString();
        return;
    }

    QByteArray data = file.readAll();
    QJsonDocument doc = QJsonDocument::fromJson(data);
    if (doc.isObject()) {
        QJsonObject jsonObj = doc.object();
        if (jsonObj.contains("temperature")) {
            m_temperature = jsonObj["temperature"].toDouble();
            emit temperatureChanged();
        }
        if (jsonObj.contains("speed")) {
            m_speed = jsonObj["speed"].toDouble();
            emit speedChanged();
        }
        if (jsonObj.contains("fuel_level")) {
            m_fuelLevel = jsonObj["fuel_level"].toDouble();
            emit fuelLevelChanged();
        }
        if (jsonObj.contains("oil_level")) {
            m_oilLevel = jsonObj["oil_level"].toDouble();
            emit oilLevelChanged();
        }
        if (jsonObj.contains("battery_level")) {
            m_batteryLevel = jsonObj["battery_level"].toDouble();
            emit batteryLevelChanged();
        }
        if (jsonObj.contains("tire_level")) {
            m_tireLevel = jsonObj["tire_level"].toDouble();
            emit tireLevelChanged();
        }
    }
}

void VehicleDataMonitor::startMonitoring()
{
    loadVehicleData();  // Load the initial values
    m_timer->start(1000);  // Refresh every 5 seconds
}
