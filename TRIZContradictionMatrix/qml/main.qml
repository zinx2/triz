import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls.Styles 1.4
import "Resources.js" as R

ApplicationWindow {
    id: appWindow
    visible: true
    width: 1500
    height: 888
    title: qsTr("Triz Contradiction Matrix")


    Component.onCompleted: {
        fadeoutTimer.running = true;
    }

    StackView
    {
        id: stackView
        anchors.fill: parent
        visible: true
        Keys.onReleased: if(event.key === Qt.Key_Back && StackView.depth > 1)
                         {
                             stackView.pop();
                             event.accepted = true;
                         }

        initialItem: MainView
        {
            id: mainView
        }
    }

    Rectangle
    {
        id: splashView
        anchors.fill: parent
        visible: true
        Image
        {
            anchors.centerIn: parent
            source: R.image("splash.jpg")
        }
        Behavior on opacity { NumberAnimation { duration: 1000 ;easing.type: Easing.OutQuad}  }
    }

    Timer
    {
      id:fadeoutTimer
      interval:10
      repeat: false
      onTriggered:{
          splashView.opacity = 0;
          hideTimer.start();
      }
    }
    Timer
    {
      id:hideTimer
      interval:300
      repeat: false
      onTriggered:
          splashView.visible=false;
    }

    //    SwipeView {
    //        id: swipeView
    //        anchors.fill: parent
    //        currentIndex: tabBar.currentIndex

    //        Page1 {
    //        }

    //        Page {
    //            Label {
    //                text: qsTr("Second page")
    //                anchors.centerIn: parent
    //            }
    //        }
    //    }

    //    footer: TabBar {
    //        id: tabBar
    //        currentIndex: swipeView.currentIndex
    //        TabButton {
    //            text: qsTr("First")
    //        }
    //        TabButton {
    //            text: qsTr("Second")
    //        }
    //    }
    function pop() { stackView.pop(); }
}

