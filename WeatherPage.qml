import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15

Item {
    id: weatherPage
    width: 360
    height: 640
    signal backRequested()

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20
        Text {
            text: "Weather"
            font.pixelSize: 20
            font.bold: true
            color: "#009985"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: 540
            anchors.leftMargin: 145
        }
        RowLayout {
            spacing: 10
            Layout.alignment: Qt.AlignHCenter

            Image {
                source: "qrc:/assets/weather_sunny.svg"
                sourceSize.width: 100
                sourceSize.height: 100
                fillMode: Image.PreserveAspectFit
                smooth: true
                antialiasing: true
            }

            ColumnLayout {
                spacing: 4

                Text {
                    text: "Tunisia"
                    font.pixelSize: 16
                    color: "#999"
                }

                Text {
                    text: "28°C"
                    font.pixelSize: 24
                    font.bold: true
                    color: "white"
                }

                Text {
                    text: "Outdoor Temperature"
                    font.pixelSize: 12
                    color: "#009985"
                }
            }
        }

        GridLayout {
            columns: 2
            rowSpacing: 15
            columnSpacing: 40
            Layout.alignment: Qt.AlignHCenter

            // Humidity
            Column {
                spacing: 5
                Image {
                    source: "qrc:/assets/humidity_icon.svg"
                    width: 32
                    height: 32
                    fillMode: Image.PreserveAspectFit
                }
                Text {
                    text: "Humidity"
                    font.pixelSize: 14
                    color: "#999"
                }
                Text {
                    text: "65%"
                    font.pixelSize: 16
                    font.bold: true
                    color: "#009985"
                }
            }

            // Wind Speed
            Column {
                spacing: 5
                Image {
                    source: "qrc:/assets/wind_icon.svg"
                    width: 32
                    height: 32
                    fillMode: Image.PreserveAspectFit
                }
                Text {
                    text: "Wind"
                    font.pixelSize: 14
                    color: "#999"
                }
                Text {
                    text: "12 km/h"
                    font.pixelSize: 16
                    font.bold: true
                    color: "#009985"
                }
            }

            // Precipitation
            Column {
                spacing: 5
                Image {
                    source: "qrc:/assets/precipitation_icon.svg"
                    width: 32
                    height: 32
                    fillMode: Image.PreserveAspectFit
                }
                Text {
                    text: "Precipitation"
                    font.pixelSize: 14
                    color: "#999"
                }
                Text {
                    text: "20%"
                    font.pixelSize: 16
                    font.bold: true
                    color: "#009985"
                }
            }
        }
        // Back Button
        Button {
            text: "Back"
            anchors.horizontalCenter: parent.horizontalCenter
            width: 200
            height: 100
            font.pixelSize: 18

            background: Rectangle {
                color: "#325A58"
                radius: 10
                border.color: "#0f172a"
                layer.enabled: true
                layer.effect: DropShadow {
                    color: "#00000080"
                    radius: 8
                    samples: 12
                    verticalOffset: 3
                }
            }

            contentItem: Label {
                text: "Back"
                font.pixelSize: 18
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.fill: parent
            }

            onClicked: backRequested()
        }
    }
}
