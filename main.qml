import QtQuick 2.3
import QtQuick.Particles 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.3
Window {
    id: screen
    visible: true
    width: 480; height: 840
    title: "合成大西瓜"
    Rectangle {
        id: home
        width: parent.width;
        height: parent.height - 80
        color:"lightblue"
        GameCanvas {
            id: gameCanvas
            anchors.fill: parent
        }
    }
    Image {
        id: background
        width: parent.width;
        height: 80
        anchors.top: home.bottom
        source: "qrc:/icon/bottomBack.png"
        fillMode: Image.PreserveAspectCrop
    }

    FinishWindow {
        anchors.fill: parent
        visible: gameCanvas.finish == 2
        score: gameCanvas.score
    }

}
