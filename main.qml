import QtQuick
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.15
import QtQuick.Window

Window {
    id: root
    width: 1024
    height: 680
    visible: true
    title: qsTr("DLTrainer")

    property string for_clas_text_color: "black"
    property string for_det_text_color: "white"
    property string for_seg_text_color: "white"

    Column{
        spacing: 5
        anchors.fill:parent

        // 侧边栏与训练配置模块
        Row{
            id: train
            spacing: 10
            width: parent.width
            height: parent.height*0.8

            property int block_space: 10
            property int block_height: (for_clas.height-2*block_space-20)/3
            property int block_width: for_clas.width-20
            property int block_board_width: 1
            property int block_radius: 5

            // 侧边栏
            Item{
                visible: true
                width: parent.width * 0.2
                height: parent.height

                Rectangle{
                    visible: true
                    anchors.fill: parent
                    width: parent.width
                    height: parent.height
                    color: "#E3F2FD"

                    // 任务类型切换按钮
                    Column{
                        spacing: 10
                        padding: 15
                        anchors.fill:parent
                        // 图像分类按钮
                        Rectangle{
                            visible: true
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: parent.width
                            height: parent.height*0.31
                            color: Qt.rgba(219/255, 84/255, 97/255, 0.6)

                            Text{
                                anchors.centerIn: parent
                                text: "图像分类"
                                color: for_clas_text_color
                                font.pointSize: 15
                            }

                            MouseArea{
                                anchors.fill: parent

                                onClicked: {
                                    for_clas.visible=true
                                    for_det.visible=false
                                    for_seg.visible=false

                                    for_clas_text_color="black"
                                    for_det_text_color="white"
                                    for_seg_text_color="white"

                                    console.log("for_clas button clicked")
                                }
                            }

                        }

                        // 目标检测按钮
                        Rectangle{
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: parent.width
                            height: parent.height*0.31
                            color: Qt.rgba(104/255, 105/255, 99/255, 0.6)
                            Text{
                                anchors.centerIn: parent
                                text: "目标检测"
                                color: for_det_text_color
                                font.pointSize: 15
                            }

                            MouseArea{
                                anchors.fill: parent

                                onClicked: {
                                    for_clas.visible=false
                                    for_det.visible=true
                                    for_seg.visible=false

                                    for_clas_text_color="white"
                                    for_det_text_color="black"
                                    for_seg_text_color="white"

                                    console.log("for_det button clicked")
                                }
                            }

                        }

                        // 图像分割按钮
                        Rectangle{
                            anchors.horizontalCenter: parent.horizontalCenter
                            width: parent.width
                            height: parent.height*0.31
                            color: Qt.rgba(138/255, 162/255, 158/255, 0.6)
                            Text{
                                anchors.centerIn: parent
                                text: "图像分割"
                                color: for_seg_text_color
                                font.pointSize: 15
                            }

                            MouseArea{
                                anchors.fill: parent

                                onClicked: {
                                    for_clas.visible=false
                                    for_det.visible=false
                                    for_seg.visible=true

                                    for_clas_text_color="white"
                                    for_det_text_color="white"
                                    for_seg_text_color="black"

                                    console.log("for_seg button clicked")
                                }
                            }
                        }
                    }

                }
            }

            // 图像分类 训练配置模块
            Item{
                id: for_clas
                visible: true
                width: parent.width*0.8-parent.width*0.01
                height: parent.height-1

                Rectangle{
                    anchors.fill: parent
                    width: parent.width
                    height: parent.height
                    radius: 5
                    border.color: "#DB5461"
                    border.width: 2
                    color: "#FAFAFA"

                    Column{
                        anchors.fill: parent
                        padding: 10
                        spacing: train.block_space

                        // 数据处理
                        Rectangle{
                            anchors.horizontalCenter: parent.horizontalCenter
                            width:train.block_width
                            height:train.block_height
                            radius: train.block_radius
                            color: "#FAFAFA"
                            border.color:"grey"
                            border.width: train.block_board_width

                            Text{
                                padding: 5
                                text:"数据处理"
                                font.pointSize: 10
                            }
                        }
                        // 模型训练超参数配置
                        Rectangle{
                            anchors.horizontalCenter: parent.horizontalCenter
                            width:train.block_width
                            height:train.block_height
                            radius: train.block_radius
                            color: "#FAFAFA"
                            border.color:"grey"
                            border.width: train.block_board_width

                            Text{
                                padding: 5
                                text:"模型训练"
                                font.pointSize: 10
                            }
                        }
                        // 模型测试与模型导出
                        Rectangle{
                            anchors.horizontalCenter: parent.horizontalCenter
                            width:train.block_width
                            height:train.block_height
                            radius: train.block_radius
                            color: "#FAFAFA"
                            border.color:"grey"
                            border.width: train.block_board_width

                            Text{
                                padding: 5
                                text:"模型测试与导出"
                                font.pointSize: 10
                            }
                        }
                    }
                }
            }

            // 目标检测 训练配置模块
            Item{
                id: for_det
                visible: false
                width: parent.width * 0.8-parent.width*0.01
                height: parent.height-1

                Rectangle{
                    anchors.fill: parent
                    width: parent.width
                    height: parent.height
                    radius: 5
                    border.color: "#686963"
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

            // 图像分割 训练配置模块
            Item{
                id: for_seg
                visible: false
                width: parent.width * 0.8-parent.width*0.01
                height: parent.height-1

                Rectangle{
                    anchors.fill: parent
                    width: parent.width
                    height: parent.height
                    radius: 5
                    border.color: "#8AA29E"
                    border.width: 2
                    color: "#FAFAFA"

                    Text{
                        text:"还没有开发完成。。。"
                        anchors.centerIn: parent
                        font.pointSize: 20
                    }

                    MouseArea{
                        anchors.fill: parent
                        onClicked:{
                            console.log("test: ", mouse.x, mouse.y)
                        }
                    }
                }
            }
        }

        // 日志
        Rectangle{
            id: log_block
            width:root.width
            height:parent.height*0.2-parent.spacing
            color: "#FAFAFA"
            radius: 5
            border.color:"grey"
            border.width:3

            Text{
                padding: 5
                anchors.top:parent.top
                text: "日志信息:"
                font.pointSize: 10
            }

        }
    }


}
