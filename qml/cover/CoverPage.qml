import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    id: coverPage
    transparent: true

    Label {
        id: label
        anchors.centerIn: parent
        text: coverExchange.initialized ? coverExchange.bt_dev : qsTr("BT Volume Control")
    }

    CoverActionList {
        enabled: coverExchange.initialized
        CoverAction {
            iconSource: "image://theme/icon-m-remove"
            onTriggered: {
                dbusbluez.volumeDown();
            }
        }
        CoverAction {
            iconSource: "image://theme/icon-m-add"
            onTriggered: {
                dbusbluez.volumeUp();
            }
        }
    }
    Image {
        id: bgImg
        asynchronous: true
        fillMode: Image.PreserveAspectFit
        opacity: 0.30
        source: "qrc:///btvol.png"
        anchors {
            bottom: parent.bottom
            right: parent.right
            bottomMargin: Theme.paddingMedium
            rightMargin: Theme.paddingMedium
        }
        sourceSize {
            width: coverPage.width
            height: coverPage.height
        }
    }
}
