import QtQuick 2.0
import "Resources.js" as R

Paper {
    id: mainView
    visibleBackBtn: true
    color: "orange"

    onEvtBack:
    {
        stackView.pop();
    }

}
