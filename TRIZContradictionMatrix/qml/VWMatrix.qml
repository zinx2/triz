import QtQuick 2.0
import QtQuick.Controls 2.2
import "Resources.js" as R

Paper {
    id: mainView
    visibleBackBtn: true

    Column
    {
        width: parent.width
        height: parent.height - R.height_titlaBar
        y: R.height_titlaBar

        LYMargin
        {
            height: R.dp(20)
        }

        CPSubtitle
        {
            id: subtitle
            anchors
            {
                left: parent.left
                leftMargin: R.dp(20)
            }
            title : "공학변수별 설명"
        }

        LYMargin
        {
            height: R.dp(20)
        }

        CPListViewMatrix
        {
            width: parent.width
            height: parent.height - R.height_titlaBar - subtitle.height - R.dp(20) * 3
            anchors
            {
                left: subtitleLayout.left
                leftMargin: R.dp(20)
                right: subtitleLayout.right
                rightMargin: R.dp(20)
            }
        }

        LYMargin
        {
            height: R.dp(20)
        }
    }

    onEvtBack:
    {
        stackView.pop();
    }
}
