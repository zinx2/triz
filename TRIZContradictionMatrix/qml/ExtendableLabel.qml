import QtQuick 2.0
import "Resources.js" as R

Rectangle
{
    id: extendableLabel
    width: parent.width
    height: extended ? R.dp(50) + detailData.height : R.dp(50)

    property string image_extended: R.image("extended.png")
    property string image_extendable: R.image("extendable.png")
    property string title_no: ""
    property string title_ko: ""
    property string title_en: ""    
    property string contents: ""
    property bool extended: false
    signal _clicked()

    Column
    {
        id: dataLayout
        width: parent.width
        height: parent.height

        Rectangle
        {
            id: metaData
            width: parent.width
            height: R.dp(50)
            color: ma.pressed ? R.color_buttonPressed : extendableLabel.color

            Row
            {
                width: parent.width
                height: parent.height
                Image
                {
                    anchors.verticalCenter: parent.verticalCenter
                    source: extended ? image_extended : image_extendable
                    width: R.dp(30)
                    height: R.dp(30)
                }

                ExtendedText
                {
                    id: noTxt
                    text: title_no
                    height: parent.height
                    font.pointSize: R.pt(25)
                    verticalAlignment: Text.AlignVCenter
                }

                ExtendedText
                {
                    id: koTxt
                    text: title_ko
                    height: parent.height
                    font.pointSize: R.pt(25)
                    verticalAlignment: Text.AlignVCenter
                }

                ExtendedText
                {
                    id: enTxt
                    text: title_en
                    height: parent.height
                    font.pointSize: R.pt(25)
                    verticalAlignment: Text.AlignVCenter
                }
            }


            MouseArea {
                id: ma
                anchors.fill: parent
                onClicked: {
//                    extendableLabel._clicked();
                    extended = !extended;
//                    detailData.visible = extended;
//                    console.log(extendableLabel.height);
//                    update();

//                    color = ma.pressed ? "steelblue" : "lightsteelblue";
//                    color = Qt.binding(function() { return ma.pressed ? "steelblue" : "lightsteelblue" });
//                    metaData.height = Qt.binding(function() { return ma.pressed ? R.dp(80) : R.dp(50) });
                }
            }
        }

        Rectangle
        {
            id: detailData
            width: parent.width
            height: detail.contentHeight
            visible: extended
            anchors
            {
                left: parent.left
                leftMargin: R.dp(30)
                right: parent.right
                rightMargin: R.dp(70)
            }

            Row
            {
                width: parent.width
                height: parent.height
                spacing: R.dp(5)
                Image
                {
                    source: image_extended
                    width: R.dp(30)
                    height: R.dp(30)
                }

                ExtendedTextEdit
                {
                    id: detail
                    text: contents
                    font.pointSize: R.pt(20)
                    color: "black"
                    wrapMode: TextEdit.Wrap

                }
            }
        }
    }
}
