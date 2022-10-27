import QtQuick 2.0
import Sailfish.Silica 1.0
import Nemo.DBus 2.0
import "pages"

ApplicationWindow {
    initialPage: Component { FirstPage { } }
    cover: Qt.resolvedUrl("cover/CoverPage.qml")
    allowedOrientations: defaultAllowedOrientations

    Item {
        id: coverExchange
        property bool initialized: false
        property string bt_dev: ""
    }

    Item {
        DBusInterface {
            property string _deviceAddress
            id: dbusbluez
            bus: DBus.SystemBus
            service: 'org.bluez'
            iface: 'org.bluez.MediaControl1'
            //path: '/org/bluez/hci0/dev_00_00_00_00_00_00' //_deviceAddress
            path: _deviceAddress

            function volumeUp() {
                call('VolumeUp',
                     undefined,
                     function(result) {
                         // console.log('call completed with:', result)
                     },
                     function(error, message) {
                         // console.log('call failed', error, 'message:', message)
                     })
            }
            function volumeDown() {
                call('VolumeDown',
                     undefined,
                     function(result) {
                         // console.log('call completed with:', result)
                     },
                     function(error, message) {
                         // console.log('call failed', error, 'message:', message)
                     })
            }
        }
    }
}
