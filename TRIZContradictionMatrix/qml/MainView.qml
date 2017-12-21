import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
//import "concept" 1.0
import "Resources.js" as R

Paper {
    id: mainView
    width: parent.width
    height: parent.height
    visibleBackBtn: true

    Column
    {
        id: mainColumn
        width: parent.width
        height: parent.height - R.dp(144)
        y: R.height_titlaBar

        Rectangle
        {
            id: selectView
            width: parent.width
            height: R.dp(501)
            color: R.color_bgColor001

            Column
            {
                width: parent.width
                height: parent.height
                spacing: R.dp(20)
                Row
                {
                    id: rowButtons
                    width: R.dp(800)
                    height: R.dp(120)
                    anchors
                    {
                        right: parent.right
                    }
                    ExtendedButton
                    {
                        type: "text"
                        btnName: "모순행렬이란?"
                        fontSize: R.pt(20)
                        pressedColor: R.color_buttonPressed
                        sourceWidth: rowButtons.width / 2 //R.dp(300)
                        sourceHeight: rowButtons.height //R.dp(150)
                        on_Clicked:
                        {
                            console.log("모순행렬");
                            stackView.push("MatrixView.qml");
                        }
                    }

                    ExtendedButton
                    {
                        type: "text"
                        btnName: "공학변수 보기"
                        fontSize: R.pt(20)
                        pressedColor: R.color_buttonPressed
                        sourceWidth: rowButtons.width / 2 //R.dp(300)
                        sourceHeight: rowButtons.height
                        on_Clicked:
                        {
                            console.log("공학변수 보기");
                            //                stackView.push("Page.qml");
                        }
                    }
                }

                Subtitle
                {
                    anchors
                    {
                        left: parent.left
                        leftMargin: R.dp(20)
                    }
                    title : "개선되는 특성"
                }

                ExtendedComboBox
                {
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
                Margin { }

                Subtitle
                {
                    anchors
                    {
                        left: parent.left
                        leftMargin: R.dp(20)
                    }
                    title : "악화되는 특성"
                }

                ComboBox
                {
                    width: parent.width
                    height: R.dp(50)
                    anchors
                    {
                        left: parent.left
                        leftMargin: R.dp(40)
                        right: parent.right
                        rightMargin: R.dp(40)
                    }

                    model: [ "A", "B", "C", "D" ]
                }
            }

            ExtendedButton
            {
                type: "text"
                btnName: "발명원리 탐색"
                fontSize: R.pt(20)
                pressedColor: R.color_buttonPressed
                rectColor: R.color_buttonColor001
                textColor: "white"
                sourceWidth: R.dp(220)
                sourceHeight: R.dp(80)
                radius: 10
                anchors
                {
                    right: parent.right
                    rightMargin: R.dp(20)
                    bottom: parent.bottom
                    bottomMargin: R.dp(20)
                }

                on_Clicked:
                {
                    console.log("공학변수 보기");
                    //                stackView.push("Page.qml");
                }
            }
        }


        Rectangle
        {
            id: resultView
            width: parent.width
            height: mainColumn.height - selectView.height
            color: "white"

            Subtitle
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

            ListView {
                width: parent.width
                height: parent.height - subtitle.height
                clip: true
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

                model: opt.ds ? ds_model : md.eng
                delegate: ExtendableLabel {
                    title_no: (opt.ds ? number : (model.modelData.id + 1)) + ". "
                    title_ko: opt.ds ? name : model.modelData.name
                    contents: opt.ds ? content : model.modelData.desc1
                }
            }

            ListModel {
                            id: ds_model
                            ListElement {
                                name: "Bill Smith"
                                number: "0"
                                content: "conttetwetpwfjpwefpojwepofjw234234pojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojefconttetwetpwfjpwefpojwepofjwpojef555"
                                text: "AAA"
                            }
                            ListElement {
                                name: "John Brown"
                                number: "1"
                                content: "conttetwetpwfjpwefpojwepofjwpojef"
                                text: "BBB"
                            }
                            ListElement {
                                name: "Sam Wise"
                                number: "2"
                                content: "conttetwetpwfjpwefpojwepofjwpojef"
                                text: "CCC"
                            }
                            ListElement {
                                name: "Bill Smith"
                                number: "3"
                                content: "conttetwetpwfjpwefpojwepofjwpojef"
                                text: "DDD"
                            }
                            ListElement {
                                name: "John Brown"
                                number: "4"
                                content: "conttetwetpwfjpwefpojwepofjwpojef"
                                text: "EEE"
                            }
                            ListElement {
                                name: "Sam Wise"
                                number: "5"
                                content: "conttetwetpwfjpwefpojwepofjwpojef"
                                text: "FFF"
                            }
                            ListElement {
                                name: "Bill Smith"
                                number: "6"
                                content: "conttetwetpwfjpwefpojwepofjwpojef"
                            }
                            ListElement {
                                name: "John Brown"
                                number: "7"
                                content: "conttetwetpwfjpwefpojwepofjwpojef"
                            }
                            ListElement {
                                name: "Sam Wise"
                                number: "8"
                                content: "conttetwetpwfjpwefpojwepofjwpojef"
                            }
                            ListElement {
                                name: "Bill Smith"
                                number: "9"
                                content: "conttetwetpwfjpwefpojwepofjwpojef"
                            }
                            ListElement {
                                name: "John Brown"
                                number: "10"
                                content: "conttetwetpwfjpwefpojwepofjwpojef"
                            }
                            ListElement {
                                name: "Sam Wise"
                                number: "11"
                                content: "conttetwetpwfjpwefpojwepofjwpojef"
                            }
                            ListElement {
                                name: "Bill Smith"
                                number: "12"
                                content: "conttetwetpwfjpwefpojwepofjwpojef"
                            }
                            ListElement {
                                name: "John Brown"
                                number: "13"
                                content: "conttetwetpwfjpwefpojwepofjwpojef"
                            }
                            ListElement {
                                name: "Sam Wise"
                                number: "14"
                                content: "conttetwetpwfjpwefpojwepofjwpojef"
                            }
                            ListElement {
                                name: "Bill Smith"
                                number: "15"
                                content: "conttetwetpwfjpwefpojwepofjwpojef"
                            }
                            ListElement {
                                name: "John Brown"
                                number: "16"
                                content: "conttetwetpwfjpwefpojwepofjwpojef"
                            }
                            ListElement {
                                name: "Sam Wise"
                                number: "17"
                                content: "conttetwetpwfjpwefpojwepofjwpojef"
                            }
                            ListElement {
                                name: "Bill Smith"
                                number: "18"
                                content: "conttetwetpwfjpwefpojwepofjwpojef"
                            }
                            ListElement {
                                name: "John Brown"
                                number: "19"
                                content: "conttetwetpwfjpwefpojwepofjwpojef"
                            }
                            ListElement {
                                name: "Sam Wise"
                                number: "20"
                                content: "conttetwetpwfjpwefpojwepofjwpojef"
                            }
                            ListElement {
                                name: "Bill Smith"
                                number: "21"
                                content: "conttetwetpwfjpwefpojwepofjwpojef"
                            }
                            ListElement {
                                name: "John Brown"
                                number: "22"
                                content: "conttetwetpwfjpwefpojwepofjwpojef"
                            }
                            ListElement {
                                name: "Sam Wise"
                                number: "23"
                                content: "conttetwetpwfjpwefpojwepofjwpojef"
                            }
                        }
        }
    }

    Component.onCompleted:
    {
        console.log(md.eng);
        console.log(md.list);
    }
}

