import QtQuick 2.0
import QtQuick.Controls 1.1
import CharCodes 1.0

ApplicationWindow {
    visible: true
    width: 480
    height: 320

    TextField {
        id: inputString

        focus: true
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.margins: 5

        onTextChanged: gridCharacters.model.text = text
    }

    GridView {
        id: gridCharacters

        model: textCharacterModel
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: inputString.bottom
        anchors.margins: 5
    }
}
