import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.15
import QtQuick.Shapes 1.15

Item {
    id: tirepage
    width: 300
    height: 300


    // Bind tire directly to the C++ backend's property
    property real tire: vehicleDataMonitor.tireLevel
    property real maxTire: 10

    signal backRequested()


    Rectangle {
        anchors.fill: parent
        color: "transparent"

        Item {
            anchors.centerIn: parent
            anchors.horizontalCenterOffset: 50

            Column {
                spacing: 20
                anchors.horizontalCenter: parent.horizontalCenter

                Text {
                    text: "Tire Pressure"
                    font.pixelSize: 26
                    font.bold: true
                    color: "#009985"
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Item {
                    width: 300
                    height: 300
                    anchors.horizontalCenter: parent.horizontalCenter

                    Canvas {
                        id: arcCanvas
                        anchors.fill: parent

                        onPaint: {
                            var ctx = getContext("2d");
                            ctx.reset();

                            var centerX = width / 2;
                            var centerY = height / 2;
                            var radius = width / 2 - 20;

                            var startAngle = 135 * Math.PI / 180;
                            var endAngle = 45 * Math.PI / 180;
                            var currentAngle = startAngle + (tire / maxTire) * (2 * Math.PI - (startAngle - endAngle));

                            var gradient = ctx.createLinearGradient(0, 0, width, 0);
                            gradient.addColorStop(0, "#00c3ff");
                            gradient.addColorStop(0.5, "#60f994");
                            gradient.addColorStop(1, "#ffee00");

                            ctx.beginPath();
                            ctx.lineWidth = 18;
                            ctx.strokeStyle = "#1e1e1e";
                            ctx.arc(centerX, centerY, radius, startAngle, startAngle + 2 * Math.PI - (startAngle - endAngle));
                            ctx.stroke();

                            ctx.beginPath();
                            ctx.lineWidth = 18;
                            ctx.strokeStyle = gradient;
                            ctx.arc(centerX, centerY, radius, startAngle, currentAngle);
                            ctx.stroke();
                        }

                        Connections {
                            target: tirepage
                            onTirelevelChanged: arcCanvas.requestPaint()
                        }
                    }

                    Rectangle {
                        width: 120
                        height: 120
                        radius: 60
                        anchors.centerIn: parent
                        color: "#0e0e0e"
                        opacity: 0.9

                        SequentialAnimation on scale {
                            loops: Animation.Infinite
                            NumberAnimation { from: 1.0; to: 1.05; duration: 1000; easing.type: Easing.InOutQuad }
                            NumberAnimation { from: 1.05; to: 1.0; duration: 1000; easing.type: Easing.InOutQuad }
                        }
                    }

                    Column {
                        anchors.centerIn: parent

                        Text {
                            text: Math.round(tire)
                            font.pixelSize: 20
                            font.bold: true
                            color: "#999"
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            anchors.bottomMargin: -15
                            anchors.leftMargin: -25
                        }

                        Text {
                            text: "bar"
                            font.pixelSize: 20
                            color: "#999"
                            anchors.bottom: parent.bottom
                            anchors.left: parent.left
                            anchors.bottomMargin: -15
                            anchors.leftMargin: 0
                        }
                    }

                    Image {
                        source: "qrc:/assets/tire.svg"
                        width: 32
                        height: 32
                        anchors.bottom: parent.bottom
                        anchors.right: parent.right
                        anchors.bottomMargin: 20
                        anchors.rightMargin: 130
                    }
                }

                // Back Button
                Button {
                    text: "Back"
                    anchors.horizontalCenter: parent.horizontalCenter
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
    }
}
