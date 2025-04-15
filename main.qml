import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    visible: true
    width: 400
    height: 700
    title: qsTr("MyCar")
    color: "#212529"

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: homePage
    }

    Component {
        id: homePage
        HomePage {
            onNavigateToSensorsPage: {
                stackView.push(sensorsPage)
            }
            onNavigateToClimatePage: {
                stackView.push(climatePage)
            }
            onNavigateToWeatherPage: {
                stackView.push(weatherPage)
            }
            onNavigateToLightPage: {
                stackView.push(lightPage)
            }
            onNavigateToStatusPage: {
                stackView.push(statusPage)
            }
            onNavigateToSettingsPage: {
                stackView.push(settingsPage)
            }
        }
    }

    Component {
        id: sensorsPage
        SensorsPage {
            onNavigateToSpeedPage: {
                stackView.push(speedPage)
            }
            onNavigateToBatteryPage: {
                stackView.push(batteryPage)
            }
            onNavigateToFuelPage: {
                stackView.push(fuelPage)
            }
            onNavigateToOilPage: {
                stackView.push(oilPage)
            }
            onNavigateToTirePage: {
                stackView.push(tirePage)
            }
            onNavigateToWaterPage: {
                stackView.push(waterPage)
            }
            onBackRequested: {
                stackView.pop()
            }
        }
    }

    Component {
        id: speedPage
        SpeedPage {
            onBackRequested: {
                stackView.pop()
            }
        }
    }

    Component {
        id: batteryPage
        BatteryPage {
            onBackRequested: {
                stackView.pop()
            }
        }
    }

    Component {
        id: fuelPage
        FuelPage {
            onBackRequested: {
                stackView.pop()
            }
        }
    }
    Component {
        id: oilPage
        OilPage {
            onBackRequested: {
                stackView.pop()
            }
        }
    }
    Component {
        id: tirePage
        TirePage {
            onBackRequested: {
                stackView.pop()
            }
        }
    }
    Component {
        id: waterPage
        WaterPage {
            onBackRequested: {
                stackView.pop()
            }
        }
    }

    Component {
        id: climatePage
        ClimatePage {
            onBackRequested: {
                stackView.pop()
            }
        }
    }

    Component {
        id: weatherPage
        WeatherPage {
            onBackRequested: {
                stackView.pop()
            }
        }
    }

    Component {
        id: lightPage
        LightPage {
            onBackRequested: {
                stackView.pop()
            }
        }
    }
    Component {
        id: statusPage
        StatusPage {
            onBackRequested: {
                stackView.pop()
            }
        }
    }
    Component {
        id: settingsPage
        SettingsPage {
            onBackRequested: {
                stackView.pop()
            }
        }
    }
}
