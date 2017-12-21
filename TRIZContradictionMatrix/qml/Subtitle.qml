import QtQuick 2.0
import "Resources.js" as R

Row
{
    property string title : ""

    width: parent.width
    height: R.dp(48)
    spacing: R.dp(20)

    Image
    {
        source: R.image("rectangle.png");
        width: R.dp(48)
        height: R.dp(48)
        rotation: 30
    }

    ExtendedText
    {
        text: title
        font.pointSize: R.pt(25)
    }
}
