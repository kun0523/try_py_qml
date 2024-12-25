import QtQuick
import QtQuick.Controls 2.15
import "ForClas"

Item{
    id: for_seg
    visible: false
    width: root.width * 0.8-root.width*0.01
    height: parent.height-1

    Rectangle{
        anchors.fill: parent
        width: parent.width
        height: parent.height
        radius: 5
        border.color: "#8AA29E"
        border.width: 2
        color: "#FAFAFA"

        MouseArea{
            anchors.fill: parent
            onClicked:{
                console.log("test", mouse.x, mouse.y)
            }
        }
    }
}
