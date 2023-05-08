/*
    Copyright (C) 2023 Friedrich Mütschele and other contributors
    This file is part of BtVol.
    BtVol is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    avaRisk is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
    GNU General Public License for more details.
    You should have received a copy of the GNU General Public License
    along with avaRisk. If not, see <http://www.gnu.org/licenses/>.
*/

import QtQuick 2.2
import Sailfish.Silica 1.0

Page {

    SilicaFlickable {
        anchors.fill: parent
        contentHeight: parent.height

        Column {
            width: parent.width
            spacing: Theme.paddingLarge

            PageHeader {
                title: qsTr("About BtVol")
            }

            Image {
                source: "qrc:///btvol.png"
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
                width: Theme.itemSizeHuge
                height: Theme.itemSizeHuge
            }

            Label {
                text: "BtVol 1.2"
                horizontalAlignment: Text.AlignHCenter
                font.pixelSize: Theme.fontSizeExtraLarge
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Label {
                wrapMode: Text.Wrap
                x: Theme.horizontalPageMargin
                width: parent.width - Theme.horizontalPageMargin
                horizontalAlignment: Text.AlignHCenter
                text: qsTr("SailfishOS Bluetooth Device Volume Control")
                font.pixelSize: Theme.fontSizeSmall
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Label {
                text: qsTr("By Friedrich Mütschele")
                font.pixelSize: Theme.fontSizeSmall
                width: parent.width - ( 2 * Theme.horizontalPageMargin )
                horizontalAlignment: Text.AlignHCenter
                wrapMode: Text.Wrap
                linkColor: Theme.highlightColor
                onLinkActivated: Qt.openUrlExternally(link)
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Text {
                            text: "<a href=\"mailto:avarisk@10hoch-6.de\">" + qsTr("Send e-mail") + "</a>"
                            anchors {
                                horizontalCenter: parent.horizontalCenter
                            }
                            font.pixelSize: Theme.fontSizeSmall
                            linkColor: Theme.highlightColor

                            onLinkActivated: Qt.openUrlExternally("mailto:avarisk@10hoch-6.de")
            }

            Separator {
                width: parent.width
                color: Theme.primaryColor
                horizontalAlignment: Qt.AlignHCenter
            }

            Label {
                text: qsTr("Licensed under GNU GPLv3")
                font.pixelSize: Theme.fontSizeSmall
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
            }

            Text {
                text: "<a href=\"https://github.com/fridlmue/harbour-btvol\">" + qsTr("Sources on GitHub") + "</a>"
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
                font.pixelSize: Theme.fontSizeSmall
                linkColor: Theme.highlightColor

                onLinkActivated: Qt.openUrlExternally("https://github.com/fridlmue/harbour-btvol")
            }

            Label {
                wrapMode: Text.Wrap
                x: Theme.horizontalPageMargin
                width: parent.width - Theme.horizontalPageMargin
                horizontalAlignment: Text.AlignHCenter
                text: qsTr("Some code is based on snippets from Piggz Amazfish project. https://github.com/piggz/harbour-amazfish")
                font.pixelSize: Theme.fontSizeSmall
                anchors {
                    horizontalCenter: parent.horizontalCenter
                }
            }



        }
    }
}
