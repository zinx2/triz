import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
//import "concept" 1.0
import "Resources.js" as R

Paper {
    id: mainView
    visibleBackBtn: false

    Column
    {
        id: mainColumn
        width: parent.width
        height: parent.height - R.height_titlaBar
        y: R.height_titlaBar

        Rectangle
        {
            id: selectView
            width: parent.width
            height: layoutButtons1.height + subtitle1.height + combBox1.height + subtitle2.height + combBox2.height + layoutButtons2.height + R.dp(20) * 2 + R.dp(40) * 3
            color: R.color_bgColor001

            Column
            {
                width: parent.width
                height: parent.height

                Row
                {
                    id: layoutButtons1
                    width: R.dp(800)
                    height: R.dp(120)
                    anchors
                    {
                        right: parent.right
                    }
                    CPButton
                    {
                        type: "text"
                        btnName: "모순행렬이란?"
                        fontSize: R.pt(20)
                        pressedColor: R.color_buttonPressed
                        sourceWidth: layoutButtons1.width / 2 //R.dp(300)
                        sourceHeight: layoutButtons1.height //R.dp(150)
                        on_Clicked:
                        {
                            stackView.push(Qt.createComponent(R.view_file_matrix), { titleText: btnName });
                        }
                    }

                    CPButton
                    {
                        type: "text"
                        btnName: "공학변수 보기"
                        fontSize: R.pt(20)
                        pressedColor: R.color_buttonPressed
                        sourceWidth: layoutButtons1.width / 2 //R.dp(300)
                        sourceHeight: layoutButtons1.height
                        on_Clicked:
                        {
                            stackView.push(Qt.createComponent(R.view_file_enginnerring), { titleText: btnName });
                        }
                    }
                }

                CPSubtitle
                {
                    id: subtitle1
                    anchors
                    {
                        left: parent.left
                        leftMargin: R.dp(20)
                    }
                    title : "개선되는 특성"
                }
                LYMargin { height: R.dp(20) }

                CPComboBox
                {
                    id: combBox1
                    width: parent.width
                    height: R.dp(100)
                    anchors
                    {
                        left: parent.left
                        leftMargin: R.dp(40)
                        right: parent.right
                        rightMargin: R.dp(40)
                    }

                     model: opt.ds ? ds_model : md.eng
                }
                LYMargin { height: R.dp(40) }

                CPSubtitle
                {
                    id: subtitle2
                    anchors
                    {
                        left: parent.left
                        leftMargin: R.dp(20)
                    }
                    title : "악화되는 특성"
                }
                LYMargin { height: R.dp(20) }

                CPComboBox
                {
                    id: combBox2
                    width: parent.width
                    height: R.dp(100)
                    anchors
                    {
                        left: parent.left
                        leftMargin: R.dp(40)
                        right: parent.right
                        rightMargin: R.dp(40)
                    }

                     model: opt.ds ? ds_model : md.eng
                }
                LYMargin { height: R.dp(40) }

                Row
                {
                    id: layoutButtons2
                    width: R.dp(350)
                    height: R.dp(100)
                    anchors
                    {
                        right: parent.right
                        rightMargin: R.dp(40)
                    }

                    CPButton
                    {
                        type: "text"
                        btnName: "발명원리 탐색"
                        fontSize: R.pt(20)
                        pressedColor: R.color_buttonPressed
                        rectColor: R.color_buttonColor001
                        textColor: "white"
                        sourceWidth: parent.width
                        sourceHeight: parent.height
                        radius: 10
                        on_Clicked:
                        {
                            console.log("공학변수 보기");
                            //                stackView.push("Page.qml");
                        }
                    }
                }
            }            
        }

        Rectangle
        {
            id: resultView
            width: parent.width
            height: mainColumn.height - selectView.height
            color: "white"

            CPSubtitle
            {
                id: subtitle
                anchors
                {
                    top: parent.top
                    topMargin: R.dp(20)
                    left: parent.left
                    leftMargin: R.dp(20)
                }
                title : "도출되는 발명원리 목록"
            }

            CPListViewMatrix
            {
                width: parent.width
                height: parent.height - subtitle.height
                anchors
                {
                    top: subtitle.bottom
                    topMargin: R.dp(20)
                    left: parent.left
                    leftMargin: R.dp(20)
                    right: parent.right
                    rightMargin: R.dp(20)
                    bottom: parent.bottom
                    bottomMargin: R.dp(20)
                }
            }
        }
    }
}

