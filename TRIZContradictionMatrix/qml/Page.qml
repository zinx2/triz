import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
Rectangle
{
    width: parent.width
    height: parent.height
    color: "Green"
    RowLayout
    {
        Button
        {
            text: "BACK"
            onClicked: {
                appWindow.pop();
            }
        }
    }
}
