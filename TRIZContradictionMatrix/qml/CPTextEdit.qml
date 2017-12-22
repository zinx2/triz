import QtQuick 2.7
import "Resources.js" as R

TextEdit {
    width: parent.width
    height: parent.height
    readOnly: true
    text: "sample"
    color: "white"
    font.family: fontNanumBarunGothic.name
    FontLoader {
        id: fontNanumBarunGothic
        source: R.os() === "android" ? R.font("NanumBarunGothic_android.ttf") : R.font("NanumBarunGothic_ios.ttf")
    }
}
