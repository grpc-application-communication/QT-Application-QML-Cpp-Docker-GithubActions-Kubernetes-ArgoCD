#ifndef VEHICLEDATAMONITOR_H
#define VEHICLEDATAMONITOR_H

#include <QObject>
#include <QFile>
#include <QTimer>
#include <QJsonDocument>
#include <QJsonObject>

class VehicleDataMonitor : public QObject
{
    Q_OBJECT
    Q_PROPERTY(float temperature READ temperature NOTIFY temperatureChanged)
    Q_PROPERTY(float speed READ speed NOTIFY speedChanged)
    Q_PROPERTY(float fuelLevel READ fuelLevel NOTIFY fuelLevelChanged)
    Q_PROPERTY(float oilLevel READ oilLevel NOTIFY oilLevelChanged)
    Q_PROPERTY(float batteryLevel READ batteryLevel NOTIFY batteryLevelChanged)
    Q_PROPERTY(float tireLevel READ tireLevel NOTIFY tireLevelChanged)


public:
    explicit VehicleDataMonitor(QObject *parent = nullptr);

    float temperature() const;
    float speed() const;
    float fuelLevel() const;
    float oilLevel() const;
    float batteryLevel() const;
    float tireLevel() const;

signals:
    void temperatureChanged();
    void speedChanged();
    void fuelLevelChanged();
    void oilLevelChanged();
    void batteryLevelChanged();
    void tireLevelChanged();

public slots:
    void loadVehicleData();
    void startMonitoring();

private:
    float m_temperature;
    float m_speed;
    float m_fuelLevel;
    float m_oilLevel;
    float m_batteryLevel;
    float m_tireLevel;

    QTimer *m_timer;
};

#endif // VEHICLEDATAMONITOR_H
