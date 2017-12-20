import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
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
        height: parent.width - R.dp(144)
        y: R.height_titlaBar

        Rectangle
        {
            id: selectView
            width: parent.width
            height: R.dp(461)
            color: R.color_bgColor001

            Column
            {
                width: parent.width
                height: parent.height
                spacing: R.dp(20)
                Row
                {
                    id: rowButtons
                    width: R.dp(410)
                    height: R.dp(80)
                    spacing: R.dp(10)
                    anchors
                    {
                        right: parent.right
                        rightMargin: R.dp(10)
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

                ComboBox
                {
                    width: parent.width
                    height: R.dp(50)
                    anchors
                    {
                        left: parent.left
                        leftMargin: R.dp(20)
                        right: parent.right
                        rightMargin: R.dp(20)
                    }

                    model: [ "A", "B", "C", "D" ]
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
                        leftMargin: R.dp(20)
                        right: parent.right
                        rightMargin: R.dp(20)
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
            height: mainView.height - selectView.height
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

            ListModel {
                id: model
                ListElement {
                    name: "Bill Smith"
                    number: "555 3264"
                }
                ListElement {
                    name: "John Brown"
                    number: "555 8426"
                }
                ListElement {
                    name: "Sam Wise"
                    number: "555 0473"
                }
                ListElement {
                    name: "Bill Smith"
                    number: "555 3264"
                }
                ListElement {
                    name: "John Brown"
                    number: "555 8426"
                }
                ListElement {
                    name: "Sam Wise"
                    number: "555 0473"
                }
                ListElement {
                    name: "Bill Smith"
                    number: "555 3264"
                }
                ListElement {
                    name: "John Brown"
                    number: "555 8426"
                }
                ListElement {
                    name: "Sam Wise"
                    number: "555 0473"
                }
                ListElement {
                    name: "Bill Smith"
                    number: "555 3264"
                }
                ListElement {
                    name: "John Brown"
                    number: "555 8426"
                }
                ListElement {
                    name: "Sam Wise"
                    number: "555 0473"
                }
                ListElement {
                    name: "Bill Smith"
                    number: "555 3264"
                }
                ListElement {
                    name: "John Brown"
                    number: "555 8426"
                }
                ListElement {
                    name: "Sam Wise"
                    number: "555 0473"
                }
                ListElement {
                    name: "Bill Smith"
                    number: "555 3264"
                }
                ListElement {
                    name: "John Brown"
                    number: "555 8426"
                }
                ListElement {
                    name: "Sam Wise"
                    number: "555 0473"
                }
                ListElement {
                    name: "Bill Smith"
                    number: "555 3264"
                }
                ListElement {
                    name: "John Brown"
                    number: "555 8426"
                }
                ListElement {
                    name: "Sam Wise"
                    number: "555 0473"
                }
                ListElement {
                    name: "Bill Smith"
                    number: "555 3264"
                }
                ListElement {
                    name: "John Brown"
                    number: "555 8426"
                }
                ListElement {
                    name: "Sam Wise"
                    number: "555 0473"
                }
            }


            ListView {
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

                model: model
                delegate: ExtendableLabel {
                    title_ko: name + ": " + number
                }
            }
        }
    }
}

