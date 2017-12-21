import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Private 1.0
import "Resources.js" as R
ComboBox
{
    id: combBox
    currentIndex: 0
    width: parent.width
    height: parent.height

    FontLoader {
        id: fontNanumBarunGothic
        source: R.os() === "android" ? R.font("NanumBarunGothic_android.ttf") : R.font("NanumBarunGothic_ios.ttf")
    }
//    dropDownButtonWidth: parent.width

    style : ComboBoxStyle {
        background: Rectangle {
            color: "white"
            border.width: 1
        }
        label: Text {
                verticalAlignment: Text.AlignVCenter
                horizontalAlignment: Text.AlignHCenter
                font.pointSize: R.pt(25)
                font.family: fontNanumBarunGothic.name
                color: "black"
                text: model.modelData.name
                //text: opt.ds ? name : model.modelData.name // control.currentText
            }
    }







//    model: [ "A", "B", "C", "D" ]
}
