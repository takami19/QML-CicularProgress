import QtQuick 2.9

Item {
    id: root

    property int size: 150
    property int lineWidth: 6
    property int value: 0

    property color primaryColor: "black"
    property color secondaryColor: "white"
    property color textColor: "white"

    property int animationDuration: 1000

    width: size
    height: size

    onValueChanged: {
        canvas.degree = value / 100 * 360
    }

    Canvas {
        id: canvas

        property real degree: 0

        anchors.fill: parent
        antialiasing: true

        onDegreeChanged: {
            requestPaint()
        }

        onPaint: {
            var ctx = getContext("2d")

            var x = root.width / 2
            var y = root.height / 2

            var radius = root.size / 2 - root.lineWidth
            var startAngle = (Math.PI / 180) * 270
            var fullAngle = (Math.PI / 180) * (270 + 360)
            var progressAngle = (Math.PI / 180) * (270 + degree)

            ctx.reset()

            ctx.lineCap = 'round'
            ctx.lineWidth = root.lineWidth

            ctx.beginPath()
            ctx.arc(x, y, radius, startAngle, fullAngle)
            ctx.strokeStyle = root.secondaryColor
            ctx.stroke()

            ctx.beginPath()
            ctx.arc(x, y, radius, startAngle, progressAngle)
            ctx.strokeStyle = root.primaryColor
            ctx.stroke()
        }

        Behavior on degree {
            NumberAnimation {
                duration: root.animationDuration
            }
        }
    }

    Text {
        id: progressText
        font {
            styleName: "Medium"
            weight: Font.Medium
            pixelSize: 20
        }
        color: textColor
        text: "%1%".arg(value)
        anchors.centerIn: parent
    }
}
