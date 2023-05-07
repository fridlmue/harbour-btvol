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

import QtQuick 2.0
import Sailfish.Silica 1.0
import QtQml.Models 2.2
import org.kde.bluezqt 1.0 as BluezQt

Page {
    id: page
    property QtObject adapter: _bluetoothManager ? _bluetoothManager.usableAdapter : null
    property QtObject _bluetoothManager : BluezQt.Manager

    property string _deviceAddress
    property bool volumeUp: true

    function startDiscovery() {
        if (!adapter || adapter.discovering) {
            return
        }
        adapter.startDiscovery()
    }

    function stopDiscovery() {
        if (adapter && adapter.discovering) {
            adapter.stopDiscovery()
        }
    }

    function getBattPercent(model) {
        if (typeof model.battery !== "undefined") {
            return " - " + qsTr("Battery: ") + model.battery
        }
        return ""
    }

    onStatusChanged: {
        if ((status == Component.Ready))
        {
            startDiscovery()
        }
    }

    SilicaListView {
            id: listView
            anchors.fill: parent
            model: devicesModel

            PullDownMenu {
                MenuItem {
                    text: volumeUp ? qsTr("Decrease Volume") : qsTr("Increase Volume")
                    onClicked: volumeUp = !volumeUp
                 }
                MenuItem {
                    text: qsTr("About")
                    onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
                 }
            }
            delegate: ListItem {
                id: listItem
                onClicked: {
                    dbusbluez._deviceAddress = "/org/bluez/hci0/dev_" + model.Address.split(":").join("_");
                    coverExchange.bt_dev = model.FriendlyName
                    coverExchange.initialized = true
                    if (volumeUp) {
                        dbusbluez.volumeUp();
                    } else {
                        dbusbluez.volumeDown();
                    }

                }
                hidden: !model.Connected
                Item {
                  anchors {
                      left: parent.left
                      right: parent.right
                      margins: Theme.horizontalPageMargin
                      verticalCenter: parent.verticalCenter
                  }

                  Label {
                      id: nameLabel
                      width: parent.width
                      text: model.FriendlyName
                      color: listItem.pressed ? Theme.highlightColor : Theme.primaryColor
                  }

                  Label {
                      id: addressLabel
                      anchors {
                          top: nameLabel.bottom
                          topMargin: Theme.paddingSmall
                      }
                      width: parent.width
                      text: model.Address + getBattPercent(model)
                      color: listItem.pressed ? Theme.secondaryHighlightColor : Theme.secondaryColor
                  }
                  height: addressLabel.height + nameLabel.height

                }
            }
            header: Column {
                height: header.height + Theme.paddingLarge
                width: parent.width

                PageHeader {
                    id: header
                    title: qsTr("Device List")
                    description: volumeUp ? qsTr("Tap on Device to increase internal Volume") : qsTr("Tap on Device to decrease internal Volume")
                }
            }
            VerticalScrollDecorator { flickable: listView }
    }

    BluezQt.DevicesModel {
           id: devicesModel
           filters: BluezQt.DevicesModelPrivate.AllDevices
       }



}
