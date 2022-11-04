//author王梓竞

//成绩值显示控件
import QtQuick 2.3

Canvas {
    property int value: 1200
    property int numberWidth: numberImage.sourceSize.width / 10
    property int numberHeight: numberImage.sourceSize.height
    property int drawWidth:  numberWidth * height / numberHeight

    id: canvas
    width: drawWidth * value.toString().length  //显示宽度为动态设置
    height: 40
    z: 50
    onPaint: {
        var context = getContext('2d')
        context.clearRect(0,0, canvas.width, canvas.height);
        var scoreStr  = value.toString()
        var dy = 0
        var spacing = 5
        var dx = canvas.width/2 -  ((drawWidth + spacing) * scoreStr.length - spacing)/2;

        for (var i in scoreStr) {
            context.drawImage(numberImage, numberImage.getNumberX(parseInt(scoreStr[i])),
                              0, numberWidth,numberHeight,
                              dx, dy, drawWidth, height);
            dx += drawWidth - spacing
        }
    }

    Image {
        id : numberImage

        source: "qrc:/icon/number1.png"
        visible: false
        mipmap: true

        function getNumberX(num) {
            return sourceSize.width / 10 * num
        }
    }
    onValueChanged: canvas.requestPaint()
}
