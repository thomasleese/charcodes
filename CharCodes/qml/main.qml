import QtQuick 2.0
import QtQuick.Controls 1.1
import CharCodes 1.0

ApplicationWindow {
    visible: true
    width: 480
    height: 320

    Clipboard {
        id: clipboard
    }

    TextField {
        id: inputString

        focus: true
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 5

        onTextChanged: gridCharacters.model.text = text
    }

    Component {
        id: componentCharacter

        Item {
            width: gridCharacters.cellWidth
            height: gridCharacters.cellHeight

            Rectangle {
                id: container
                width: gridCharacters.cellWidth - 10
                height: gridCharacters.cellHeight - 10
                anchors.centerIn: parent
                color: "#EEEEEE"

                Column {
                    spacing: 5
                    anchors.centerIn: parent

                    ClipboardText {
                        text: raw
                        anchors.horizontalCenter: parent.horizontalCenter
                        onSaved: rectNotification.state = "visible"
                    }

                    ClipboardText {
                        text: unicode
                        color: "#555555"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onSaved: rectNotification.state = "visible"
                    }

                    ClipboardText {
                        text: htmlEntity
                        color: "#555555"
                        anchors.horizontalCenter: parent.horizontalCenter
                        onSaved: rectNotification.state = "visible"
                    }
                }
            }
        }
    }

    GridView {
        id: gridCharacters

        model: textCharacterModel
        clip: true
        cellWidth: 90
        delegate: componentCharacter
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: inputString.bottom
        anchors.margins: 5

        add: Transition {
            ParallelAnimation {
                NumberAnimation { property: "opacity"; from: 0; duration: 250 }
                NumberAnimation { properties: "x,y"; from: 0; duration: 250 }
            }
        }

        remove: Transition {
            ParallelAnimation {
                NumberAnimation { property: "opacity"; to: 0; duration: 250 }
                NumberAnimation { properties: "x,y"; to: 0; duration: 250 }
            }
        }
    }

    Rectangle {
        id: rectNotification

        color: "#AA333333"
        width: parent.width * 0.8
        height: 48
        radius: 10
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 16
        opacity: 0

        states: State {
            name: "visible"
            PropertyChanges {
                target: rectNotification
                opacity: 1
            }
        }

        transitions: [
            Transition {
                from: ""
                to: "visible"
                SequentialAnimation {
                    PropertyAnimation { target: rectNotification; property: "opacity"; duration: 250 }
                    PauseAnimation { duration: 500 }
                    ScriptAction { script: rectNotification.state = "" }
                }
            },

            Transition {
                from: "visible"
                to: ""
                PropertyAnimation { target: rectNotification; property: "opacity"; duration: 250 }
            }
        ]

        Text {
            text: "Saved to clipboard."
            color: "#FFFFFF"
            anchors.centerIn: parent
        }
    }
}
