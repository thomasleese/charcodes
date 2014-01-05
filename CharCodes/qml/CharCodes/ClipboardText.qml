import QtQuick 2.0
import CharCodes 1.0

Text {
    signal saved(string text)

    Clipboard {
        id: clipboard
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            clipboard.setText(parent.text);
            saved(parent.text);
        }
    }
}
