import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Item {
    id: homepage
    signal navigateToSensorsPage()
    signal navigateToWeatherPage()
    signal navigateToLightPage()
    signal navigateToStatusPage()
    signal navigateToSettingsPage()
    signal navigateToClimatePage()
    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 5
        Image {
            source: "qrc:/assets/logo.svg"
            width: 5
            height: 5
            fillMode: Image.PreserveAspectFit
            Layout.alignment: Qt.AlignLeft
            Layout.leftMargin: 40
        }

        Text {
            text: "Select an Option"
            font.pixelSize: 18
            font.bold: true
            color: "#009985"
            horizontalAlignment: Text.AlignHCenter
            Layout.alignment: Qt.AlignHCenter
        }

        GridLayout {
            columns: 2
            rowSpacing: 15
            columnSpacing: 15
            Layout.alignment: Qt.AlignHCenter

            Repeater {
                model: [
                    { label: "Vehicle Dashboard", icon: "qrc:/assets/ic_sensors.svg" },
                    { label: "Climate", icon: "qrc:/assets/Climate.svg" },
                    { label: "Weather", icon: "qrc:/assets/weather.svg" },
                    { label: "Light", icon: "qrc:/assets/ic_flashlight.svg" },
                    { label: "Vehicle Status", icon: "qrc:/assets/ic_status.svg" },
                    { label: "Settings", icon: "qrc:/assets/ic_settings.svg" },
                ]

                delegate: Rectangle {
                    width: 150
                    height: 100
                    radius: 20
                    color: "#325A58"

                    Column {
                        anchors.centerIn: parent
                        spacing: 5
                        width: parent.width

                        Image {
                            source: modelData.icon
                            width: 30
                            height: 30
                            fillMode: Image.PreserveAspectFit
                            anchors.horizontalCenter: parent.horizontalCenter
                        }

                        Text {
                            text: modelData.label
                            font.pixelSize: 14
                            color: "white"
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment: Text.AlignVCenter
                            anchors.horizontalCenter: parent.horizontalCenter
                            wrapMode: Text.WordWrap
                            width: parent.width * 0.9
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log("Clicked:", modelData.label)
                            if (modelData.label === "Vehicle Dashboard") {
                                navigateToSensorsPage()
                            }
                            else if (modelData.label === "Climate") {
                                navigateToClimatePage()
                            }
                            else if (modelData.label === "Weather") {
                                navigateToWeatherPage()
                            }
                            else if (modelData.label === "Light") {
                                navigateToLightPage()
                            }
                            else if (modelData.label === "Vehicle Status") {
                                navigateToStatusPage()
                            }
                            else if (modelData.label === "Settings") {
                                navigateToSettingsPage()
                            }
                        }
                    }

                }
            }
        }
    }
}
