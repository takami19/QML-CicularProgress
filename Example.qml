import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id: mainWindow
    width: 640
    height: 480
    visible: true
    title: qsTr("Hello World")
    CircularProgress {
        id: progresser
        anchors.centerIn: parent
        value: 0
        textColor: "red"
        secondaryColor: "gray"
    }

    Timer {
        repeat: true
        running: true
        interval: 1000
        onTriggered: {
            progresser.value += 10
            if (progresser.value > 100) {
                progresser.value = 0
            }
        }
    }
}
