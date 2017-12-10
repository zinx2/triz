import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "Resources.js" as R

Rectangle {
    id: mainView

    color:"blue"

    Component.onCompleted: {
        R.log();
        console.log(R.dp(150));
    }

    ColumnLayout
    {
        id:columnLayout
        Rectangle
        {
            id: titleBar
            height: R.dp(150)
            width: R.dp(150)//mainView.width
            color: "Red"
        }

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
    }


//    Button {
//        width: R.dp(50)
//        height: R.dp(50)
//        onClicked: {
//            console.log(R.sz(500));
//        }
//    }
}
