import QtQuick 2.0
import CharCodes 1.0

Text {
    Clipboard {
        id: clipboard
    }

    MouseArea {
        anchors.fill: parent
        onClicked: clipboard.setText(parent.text)
    }
}
