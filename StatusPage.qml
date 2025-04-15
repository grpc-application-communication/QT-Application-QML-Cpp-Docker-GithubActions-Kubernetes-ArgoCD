import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0

Item {
    id: statusPage
    width: 360
    height: 640
    signal backRequested()

    Column {
        anchors.fill: parent
        Text {
            text: "Vehicle Status"
            font.pixelSize: 20
            font.bold: true
            color: "#009985"
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: 570
            anchors.leftMargin: 130
        }

        Image {
            id: carImage
            source: "qrc:/assets/car_outline.svg"
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: 130
            anchors.leftMargin: 120
        }

        Image {
            source: "qrc:/assets/ic_lock_red.svg"
            width: 32
            height: 32
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: 220
            anchors.leftMargin: 265
        }

        Image {
            source: "qrc:/assets/ic_lock_green.svg"
            width: 32
            height: 32
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: 320
            anchors.leftMargin: 265
        }

        Image {
            source: "qrc:/assets/ic_lock_red.svg"
            width: 32
            height: 32
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: 220
            anchors.leftMargin: 90
        }

        Image {
            source: "qrc:/assets/ic_lock_green.svg"
            width: 32
            height: 32
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: 320
            anchors.leftMargin: 90
        }

        Image {
            source: "qrc:/assets/ic_lock_red.svg"
            width: 32
            height: 32
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: 510
            anchors.leftMargin: 180
        }

        Image {
            source: "qrc:/assets/ic_lock_red.svg"
            width: 32
            height: 32
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: 85
            anchors.leftMargin: 180
        }

        // START ENGINE Button
        Button {
            text: "START ENGINE"
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: 35
            anchors.leftMargin: 140
            font.pixelSize: 16
            background: Rectangle {
                color: "#b85d3e"
                radius: 8
            }
            contentItem: Text {
                text: "START ENGINE"
                color: "white"
                font.pixelSize: 16
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.centerIn: parent
            }
        }

        // Back Button
        Button {
            text: "Back"
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: -30
            anchors.leftMargin: 130
            width: 140
            height: 50
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

    signal statusPageBackRequested()
}
