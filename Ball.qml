//author王梓竞

//小球控件

import QtQuick 2.12
Image {
    id: img

    property int pointX: 0
    property int pointY: 0
    property int preX: 0
    property int preY: 0
    property int vx: 0
    property int vy: 0
    property int r: 0
    property int cor: 0
    property int mass: 0
    property int rotate: 0
    property int ballType: 0
    property bool shapeChange: false
    property string mergeSrc: ""
    property bool mergeStart: false
    property int endPointX: 0
    property int endPointY: 0

    Behavior on width {
        NumberAnimation {
            id: widthAnima; duration: 300;
            onRunningChanged:  shapeChange = running;   //动画执行300ms结束
        }
    }

    Behavior on height { NumberAnimation { duration: 300; } }

    fillMode: Image.Stretch //动画开始的位置
    mipmap: true    //多级渐远纹理技术
    x: pointX - width/2
    y: pointY - height/2
    width: 0
    height: 0

    NumberAnimation on pointX {
        id: enPointXAnimation
        running: mergeStart == true
        to: endPointX; duration: 300
    }
    NumberAnimation on pointY {
        id: enPointYAnimation
        running: mergeStart == true
        to: endPointY; duration: 300
    }

    NumberAnimation on rotate {
        id: rotateAnimation
        running: mergeStart == true
        to: calcEndRotate()
        duration: 300
        onFinished: {
            preX = pointX
            preY = pointY
            mergeStart = false
        }
    }

    function calcEndRotate() {

        let distance = Math.sqrt(Math.pow((endPointX - pointX),2) + Math.pow((endPointY - pointY),2));  //小球移动距离

        if (endPointX > pointX)
            return rotation +  360/(2 * r * 3.14) * distance * 0.5;
        else
            return rotation -  360/(2 * r * 3.14) * distance * 0.5;

        }


}
