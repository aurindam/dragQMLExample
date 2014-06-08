import QtQuick 2.0

import com.customobjects 1.0

CustomPlayer {
    id: player
    width: 40
    height: 40

    property real minimumX: 0
    property real minimumY: 0
    property real maximumX: 0
    property real maximumY: 0

    Image {
        fillMode: Image.PreserveAspectFit
        source: "qrc:///assets/soccer-ball-icon.png"
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        drag.target: player
        drag.axis: Drag.XAndYAxis
        drag.maximumX: maximumX - parent.width
        drag.maximumY: maximumY - parent.height
        drag.minimumX: minimumX
        drag.minimumY: minimumY
    }
}
