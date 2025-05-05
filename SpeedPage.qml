import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Extras 1.4
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0


Item {
    id: speedpage
    signal backRequested()
    property int speedValue: vehicleDataMonitor.speed

    Column {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 40
        anchors.horizontalCenter: parent.horizontalCenter

        Text {
            text: "Speed Level"
            color: "#009985"
            font.pixelSize: 24
            font.bold: true
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.top: parent.top
            anchors.topMargin: 50
        }

        Item {
            width: 250
            height: 250
            anchors.horizontalCenter: parent.horizontalCenter

            Rectangle {
                anchors.fill: parent
                radius: width / 2
                gradient: Gradient {
                    GradientStop { position: 0.0; color: "#ACD2CD" }
                    GradientStop { position: 1.0; color: "#333333" }
                }
                layer.enabled: true
                layer.effect: DropShadow {
                    color: "#00000080"
                    radius: 8
                    samples: 15
                    horizontalOffset: 0
                    verticalOffset: 4
                }
            }

            CircularGauge {
                id: gauge
                anchors.fill: parent
                value: speedValue
                minimumValue: 0
                maximumValue: 230
            }


            Text {
                text: "km/h"
                color: "white"
                font.pixelSize: 20
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenter: parent.verticalCenter
                anchors.verticalCenterOffset: -60
                antialiasing: true
            }

            Image {
                id: needle
                width: 10
                height: parent.height * 0.27
                anchors.centerIn: parent
                transformOrigin: Item.Bottom
                rotation: (gauge.value - gauge.minimumValue) / (gauge.maximumValue - gauge.minimumValue) * (gauge.maximumValueAngle - gauge.minimumValueAngle) + gauge.minimumValueAngle
                antialiasing: true
            }

            Glow {
                anchors.fill: needle
                radius: 5
                samples: 10
                color: "white"
                source: needle
            }
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 250
        }

        // Back Button
        Button {
            id: control
            text: "Back"
            anchors.horizontalCenter: parent.horizontalCenter
            width: 140
            height: 50
            font.pixelSize: 18

            background: Rectangle {
                color: "#325A58"
                radius: 8
                border.color: "#0f172a"
                layer.enabled: true
                layer.effect: DropShadow {
                    color: "#00000060"
                    radius: 8
                    samples: 12
                    verticalOffset: 3
                }
            }

            contentItem: Label {
                text: control.text
                font.pixelSize: 18
                color: "white"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.fill: parent
            }

            onClicked: backRequested()
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 150
        }


    }
}
