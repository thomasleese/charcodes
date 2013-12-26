import QtQuick 2.0
import QtQuick.Controls 1.1

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
    }

    GridView {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.top: inputString.bottom
        anchors.margins: 5
    }
}
