import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0

Item {
    id: sensorspage
    signal navigateToSpeedPage()
    signal navigateToBatteryPage()
    signal navigateToFuelPage()
    signal navigateToOilPage()
    signal navigateToTirePage()
    signal navigateToWaterPage()
    signal backRequested()

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: 20
        spacing: 20
        Layout.alignment: Qt.AlignTop | Qt.AlignHCenter

        Image {
                source: "qrc:/assets/car_logo.svg"
                width: 100
                height: 100
                fillMode: Image.PreserveAspectFit
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                text: "Vehicle Dashboard"
                font.pixelSize: 20
                font.bold: true
                color: "#009985"
                horizontalAlignment: Text.AlignHCenter
                Layout.alignment: Qt.AlignHCenter
            }

        ColumnLayout {
            spacing: 20
            Layout.alignment: Qt.AlignHCenter
            Repeater {
                model: [
                    { label: "Speed Level", icon: "qrc:/assets/ic_speed.svg" },
                    { label: "Battery Power", icon: "qrc:/assets/ic_battery.svg" },
                    { label: "Fuel Amount", icon: "qrc:/assets/fuel.svg" },
                    { label: "Oil Level", icon: "qrc:/assets/ic_oil.svg" },
                    { label: "Tire Pressure", icon: "qrc:/assets/tire.svg" },
                    { label: "Water Temp", icon: "qrc:/assets/temperature.svg" }
                ]

                delegate: Rectangle {
                    width: 280
                    height: 60
                    radius: 15
                    color: "#325A58"

                    Row {
                        anchors.fill: parent
                        anchors.margins: 10
                        spacing: 20

                        Image {
                            source: modelData.icon
                            width: 30
                            height: 30
                            fillMode: Image.PreserveAspectFit
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Text {
                            text: modelData.label
                            font.pixelSize: 16
                            color: "white"
                            verticalAlignment: Text.AlignVCenter
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.left: parent.left
                            anchors.leftMargin: 50
                        }

                        Item {
                            Layout.fillWidth: true
                            anchors.verticalCenter: parent.verticalCenter
                        }

                        Image {
                            source: "qrc:/assets/chevron-right.svg"
                            width: 18
                            height: 18
                            fillMode: Image.PreserveAspectFit
                            anchors.verticalCenter: parent.verticalCenter
                            anchors.right: parent.right
                        }
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            console.log("Clicked:", modelData.label)
                            if (modelData.label === "Speed Level") {
                                navigateToSpeedPage()
                            } else if (modelData.label === "Battery Power") {
                                navigateToBatteryPage()
                            } else if (modelData.label === "Fuel Amount") {
                                navigateToFuelPage()
                            } else if (modelData.label === "Oil Level") {
                                navigateToOilPage()
                            } else if (modelData.label === "Tire Pressure") {
                                navigateToTirePage()
                            } else if (modelData.label === "Water Temp") {
                                navigateToWaterPage()
                            }
                        }
                    }

                }
            }



        }

        Button {
            text: "Back"
            anchors.horizontalCenter: parent.horizontalCenter
            width: 250
            height: 100
            font.pixelSize: 25
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
            contentItem: Text {
                text: qsTr("Back")
                font.pixelSize: 18
                color: "white"
                anchors.centerIn: parent
            }
            onClicked: backRequested()
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "#212529"
        z: -1
    }
}
