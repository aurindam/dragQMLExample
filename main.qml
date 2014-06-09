import QtQuick 2.2
import QtQuick.Window 2.1
import QtQuick.Controls 1.1
import QtQuick.Layouts 1.1

Window {
    visible: true
    width: 600
    height: 600

    GameArea {
        id: gameArea
        width: parent.width
        height: 550

        Player {
            id: player
            minimumX: 10
            minimumY: 10
            maximumX: gameArea.width - 10
            maximumY: gameArea.height - 10

            onReplayStopped: {
                recordButton.enabled = true
                xBehaviour.enabled = false
                yBehaviour.enabled = false
            }
            onReplayStarted: {
                xBehaviour.enabled = true
                yBehaviour.enabled = true
            }

            Behavior on x {
                id: xBehaviour
                PropertyAnimation { easing.type: Easing.Linear; duration: 10 }
            }

            Behavior on y {
                id: yBehaviour
                PropertyAnimation { easing.type: Easing.Linear; duration: 10 }
            }
        }
    }

    Rectangle {
        id: status
        height: 50
        width: parent.width
        color: "grey"
        anchors.bottom: parent.bottom

        RowLayout {
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.verticalCenter: parent.verticalCenter
            spacing: 10
            Button {
                id: recordButton
                checkable: true
                iconSource: checked ? "qrc:///assets/Record-Pressed-icon.png" : "qrc:///assets/Record-Normal-icon.png"
                onCheckedChanged: {
                    //                    resetButton.enabled = !checked;
                    playButton.enabled = !checked;
                    checked ? player.startRecord() : player.stopRecord()
                }
            }
            //            Button {
            //                id: resetButton
            //                iconSource: "qrc:///assets/Reload-icon.png"
            //            }
            Button{
                id: playButton
                iconSource: "qrc:///assets/Play-1-Normal-icon.png"
                onClicked: {
                    recordButton.enabled = false;
                    player.startReplay()
                }
            }
        }
    }
}
