import QtQuick 2.0
import "Resources.js" as R

Row
{
    property string title : ""

    width: parent.width
    height: R.dp(30)
    spacing: R.dp(10)

    Image
    {
        source: R.image("rectangle.png");
        width: R.dp(30)
        height: R.dp(30)
        rotation: 30
    }

    ExtendedText
    {
        text: title
        font.pointSize: R.pt(25)
    }
}
