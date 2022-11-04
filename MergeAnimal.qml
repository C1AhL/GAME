//author陈海林

//小球合并时的动画效果控制
import QtQuick 2.3
import QtQml 2.15
import QtMultimedia 5.0
Item {
    property string mergeSrc: ""
    property int modelSize: 5

    id: merge

    Repeater {
        model: modelSize
        Image {
            fillMode: Image.Stretch
            anchors.fill: parent
            source: mergeSrc
            rotation: Math.random()*90
            opacity: (modelSize - index) / modelSize    // 0 -> 1
            scale:  (modelSize - index) / modelSize     // 0 -> 1

            NumberAnimation on opacity {
                id: mergeAnimation
                running: true
                to: 1.0; duration: 200
                onFinished: merge.animationFinished()
            }
        }
    }




    function animationFinished() {
        this.destroy(100);
    }
    Timer {

        running: true
        interval: 300
        onTriggered: merge.destroy()
    }

    Component.onCompleted: {}
}
