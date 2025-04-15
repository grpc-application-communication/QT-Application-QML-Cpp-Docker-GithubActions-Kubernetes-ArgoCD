import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15
import QtGraphicalEffects 1.0

Item {
    id: climatePage
    width: 300
    height: 300

    property int temperature: 23
    signal backRequested()

    Rectangle {
        anchors.centerIn: parent
        width: 250
        height: 250
        radius: width / 2
        color: "#212529"
        Text {
            text: "Climate"
            font.pixelSize: 26
            font.bold: true
            color: "#009985"
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: 170
            anchors.leftMargin: 130
        }

        Shape {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: 100
            anchors.leftMargin: 25
            ShapePath {
                strokeColor: "#999"
                strokeWidth: 15
                capStyle: ShapePath.RoundCap
                fillColor: "transparent"

                PathAngleArc {
                    centerX: width / 2
                    centerY: height / 2
                    radiusX: width / 2 - 10
                    radiusY: height / 2 - 10
                    startAngle: 0
                    sweepAngle: 360
                }
            }
        }

        Shape {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: 100
            anchors.leftMargin: 25
            ShapePath {
                strokeColor: "#009985"
                strokeWidth: 15
                capStyle: ShapePath.RoundCap
                fillColor: "transparent"

                PathAngleArc {
                    centerX: width / 2
                    centerY: height / 2
                    radiusX: width / 2 - 10
                    radiusY: height / 2 - 10
                    startAngle: 90
                    sweepAngle: (temperature / 40.0) * 360
                }
            }
        }

        Rectangle {
            id: knob
            width: 20
            height: 20
            radius: 10
            color: "#1e1e1e"
            border.color: "#ffffff"
            border.width: 2

            x: parent.width / 2 + Math.cos((temperature / 40.0) * 2 * Math.PI - Math.PI/2) * 105 - width / 2 + 160
            y: parent.height / 2 + Math.sin((temperature / 40.0) * 2 * Math.PI - Math.PI/2) * 105 - height / 2 - 43

            layer.enabled: true
            layer.effect: DropShadow {
                color: "#000000aa"
                radius: 8
                samples: 16
                verticalOffset: 2
            }
        }


        Column {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: -85
            anchors.leftMargin: 135
            spacing: 5

            Text {
                text: temperature + "°C"
                font.pixelSize: 36
                color: "white"
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                text: "Cooling..."
                font.pixelSize: 16
                color: "#aaaaaa"
                horizontalAlignment: Text.AlignHCenter
            }
        }

        // Back Button
        Button {
            text: "Back"
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.bottomMargin: -330
            anchors.leftMargin: 105
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
}
