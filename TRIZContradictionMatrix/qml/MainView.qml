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
        height: R.dp(144)
        y: R.height_titlaBar

        Rectangle
        {
            id: selectorView
            width: parent.width
            height: (mainView.height - R.height_titlaBar) / 2
            color: R.color_bgColor001

            Row
            {
                id: rowButtons
                width: R.dp(600)
                height: R.dp(150)
                anchors.right: parent.right
                ExtendedButton
                {
                    type: "text"
                    btnName: "모순행렬이란?"
                    fontSize: R.pt(40)
                    pressedColor: R.color_buttonPressed
                    sourceWidth: rowButtons.width / 2 //R.dp(300)
                    sourceHeight: rowButtons.height //R.dp(150)
                    on_Clicked:
                    {
                        console.log("모순행렬");
                        //                stackView.push("Page.qml");
                    }
                }

                ExtendedButton
                {
                    type: "text"
                    btnName: "공학변수 보기"
                    fontSize: R.pt(40)
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
        }

        Rectangle
        {
            id: resultView
            width: parent.width
            height: (mainView.height - R.height_titlaBar) / 2
            color: "yellow"
        }
    }

    //color: "#ffff00"
    //    ColumnLayout
    //    {
    //        id:columnLayout
    //        Rectangle
    //        {
    //            id: titleBar
    //            height: R.dp(150)
    //            width: R.dp(150)//mainView.width
    //            color: "Red"
    //        }

    //        SwipeView {
    //            id: view

    //            currentIndex: 1
    //            width: parent.width
    //            height: parent.height - titleBar.height

    //            Item {
    //                id: firstPage
    //            }
    //            Item {
    //                id: secondPage
    //            }
    //            Item {
    //                id: thirdPage
    //            }
    //        }
    ////        Button
    //        {
    //            text: "BACK"
    //            onClicked:
    //            {
    //                stackView.push("Page.qml");
    //            }
    //        }
    //    }


    //    Button {
    //        width: R.dp(50)
    //        height: R.dp(50)
    //        onClicked: {
    //            console.log(R.sz(500));
    //        }
    //    }
}
