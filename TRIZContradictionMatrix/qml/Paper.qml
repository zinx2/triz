import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import "Resources.js" as R

Rectangle {

    property bool visibleBackBtn : true

    width: parent.width
    height: parent.height    

    Rectangle
    {
        id: titleBar
        height: R.height_titlaBar
        width: parent.width
        color: R.color_appTitlebar

        ExtendedButton
        {
            id: btnBack
            x: 0; y: 0
            visible: visibleBackBtn
            width: parent.height
            height: parent.height
            hoverEnabled: true
            sourceWidth: R.dp(100)
            sourceHeight: R.dp(100)

            type: "image"
            on_Clicked:
            {
                console.log("CLICKED111");
//                stackView.push("Page.qml");
            }
        }

        Label
        {
            width: parent.width
            height: parent.height
            text: "TRIZ Contradiction Matrix"
            color: R.color_appTitleText
            horizontalAlignment : Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: R.pt(50)
        }
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
    //    }


    //    Button {
    //        width: R.dp(50)
    //        height: R.dp(50)
    //        onClicked: {
    //            console.log(R.sz(500));
    //        }
    //    }
}
