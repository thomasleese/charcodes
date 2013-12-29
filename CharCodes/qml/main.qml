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
                    }

                    ClipboardText {
                        text: unicode
                        color: "#555555"
                        anchors.horizontalCenter: parent.horizontalCenter
                    }

                    ClipboardText {
                        text: htmlEntity
                        color: "#555555"
                        anchors.horizontalCenter: parent.horizontalCenter
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
    }
}
