import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15
import QtMultimedia 5.15
import QtGraphicalEffects 1.0

Item{
    id: lightPage
    width: 360
    height: 640
    property bool flashOn: false
    signal backRequested()

        ColumnLayout {
            id: flashLayout
            anchors.centerIn: parent
            spacing: 24
            width: parent.width
            Text {
                text: "Light"
                font.pixelSize: 20
                font.bold: true
                color: "#009985"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.bottomMargin: 400
                anchors.leftMargin: 190
            }

            Image {
                id: flashImage
                source: flashOn ? "qrc:/assets/ic_flashon.svg" : "qrc:/assets/ic_flashoff.svg"
                width: 70
                height: 70
                fillMode: Image.PreserveAspectFit
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.bottomMargin: 150
                anchors.leftMargin: 150
            }

            Text {
                id: flashStatusText
                text: flashOn ? "Flashlight is ON" : "Flashlight is OFF"
                font.pixelSize: 18
                font.bold: true
                color: "#009985"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.bottomMargin: 90
                anchors.leftMargin: 140
            }

            Button {
                id: flashToggleButton
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.bottomMargin: 30
                anchors.leftMargin: 130
                text: "Activate / Deactivate"
                font.pixelSize: 16
                background: Rectangle {
                    color: "#333"
                    radius: 10
                }
                contentItem: Text {
                    text: flashToggleButton.text
                    color: "white"
                    font.pixelSize: 16
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                onClicked: {
                    flashOn = !flashOn
                    flashImage.source = flashOn ? "qrc:/assets/ic_flashon.svg" : "qrc:/assets/ic_flashoff.svg"
                    flashStatusText.text = flashOn ? "Flashlight is ON" : "Flashlight is OFF"

                    flashController.toggleFlash(flashOn)
                }
            }
            Button {
                text: "Back"
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.bottomMargin: -80
                anchors.leftMargin: 180
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

}
