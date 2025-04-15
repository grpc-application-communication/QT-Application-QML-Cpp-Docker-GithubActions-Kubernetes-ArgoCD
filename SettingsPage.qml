import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtGraphicalEffects 1.0

Item {
    id: settingsPage
    property int fieldWidth: parent.width * 0.8
    width: 360
    height: 640
    signal backRequested()
    Rectangle {
        anchors.fill: parent
        color: "#212529"

        ColumnLayout {
            anchors.centerIn: parent
            spacing: 16
            width: parent.width * 0.8
            Text {
                text: "Settings"
                font.pixelSize: 20
                font.bold: true
                color: "#009985"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.bottomMargin: 550
                anchors.leftMargin: 130
            }

            // Name & Surname
            Label {
                text: "Name & Surname"
                font.bold: true
                color: "#999"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 30
                anchors.topMargin: 90
            }
            TextField {
                width: settingsPage.fieldWidth
                font.pixelSize: 14
                padding: 8
                placeholderText: "Enter your name and surname"
                color: "#999"
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.leftMargin: 30
                anchors.bottomMargin: 460

                background: Rectangle {
                    radius: 10
                    color: "white"
                    border.color: "#009985"
                    border.width: 1
                }
            }




            // Email
            Label {
                text: "Email"
                font.bold: true
                color: "#999"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 30
                anchors.topMargin: 170
            }
            TextField {
                width: settingsPage.fieldWidth
                font.pixelSize: 14
                padding: 8
                placeholderText: "Enter your email"
                color: "#999"
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                anchors.leftMargin: 30
                anchors.bottomMargin: 375

                background: Rectangle {
                    radius: 10
                    color: "white"
                    border.color: "#009985"
                    border.width: 1
                }
            }



            // Phone
            Label {
                text: "Phone Number"
                font.bold: true
                color: "#999"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 30
                anchors.topMargin: 250
            }
            TextField {
                placeholderText: "Enter your phone number"
                width: settingsPage.fieldWidth
                inputMethodHints: Qt.ImhDigitsOnly
                font.pixelSize: 14
                padding: 8
                color: "#999"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.bottomMargin: 300
                anchors.leftMargin: 30
                background: Rectangle {
                    radius: 10
                    color: "white"
                    border.color: "#009985"
                    border.width: 1
                }
            }

            // Location
            Label {
                text: "Location"
                font.bold: true
                color: "#999"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 30
                anchors.topMargin: 325
            }
            TextField {
                placeholderText: "Enter your location"
                width: settingsPage.fieldWidth
                inputMethodHints: Qt.ImhDigitsOnly
                font.pixelSize: 14
                padding: 8
                color: "#999"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.bottomMargin: 225
                anchors.leftMargin: 30
                background: Rectangle {
                    radius: 10
                    color: "white"
                    border.color: "#009985"
                    border.width: 1
                }
            }

            // Car Brand
            Label {
                text: "Car Brand"
                font.bold: true
                color: "#999"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 30
                anchors.topMargin: 400
            }
            TextField {
                placeholderText: "Enter your car brand"
                width: settingsPage.fieldWidth
                inputMethodHints: Qt.ImhDigitsOnly
                font.pixelSize: 14
                padding: 8
                color: "#999"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.bottomMargin: 150
                anchors.leftMargin: 30
                background: Rectangle {
                    radius: 10
                    color: "white"
                    border.color: "#009985"
                    border.width: 1
                }
            }

            // Mileage
            Label {
                text: "Mileage (Km)"
                font.bold: true
                color: "#999"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.leftMargin: 30
                anchors.topMargin: 480
            }
            TextField {
                placeholderText: "Enter car's mileage"
                width: settingsPage.fieldWidth
                inputMethodHints: Qt.ImhDigitsOnly
                font.pixelSize: 14
                padding: 8
                color: "#999"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.bottomMargin: 70
                anchors.leftMargin: 30
                background: Rectangle {
                    radius: 10
                    color: "white"
                    border.color: "#009985"
                    border.width: 1
                }
            }

            // Save Button
            Button {
                text: "Save"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.bottomMargin: 20
                anchors.leftMargin: 135
                width: 140
                height: 50
                background: Rectangle {
                    color: "#b85d3e"
                    radius: 8
                }
                contentItem: Text {
                    text: "Save"
                    color: "white"
                    font.pixelSize: 14
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    anchors.centerIn: parent
                }

                onClicked: {
                    // Emit a signal or handle save logic here
                    console.log("Settings saved!")
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
    }
}
