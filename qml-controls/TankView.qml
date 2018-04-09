import QtQuick 2.9
import QtQuick.Controls 2.2
import harbour.carbudget 1.0


TankViewForm {
    property alias contextMenu: contextMenu
    property int currentTank: -1

    Menu {
        id: contextMenu
        MenuItem {
            text: qsTr("New Tank")
            onClicked: {
                currentTank = -1
                tankDialog.createTank()
            }
        }
    }

    RoundButton {
        text: qsTr("+")
        highlighted: true
        anchors.margins: 10
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        onClicked: {
            currentTank = -1
            tankDialog.createTank()
        }
    }

    TankEntry {
        id: tankDialog
        onFinished: {
            /*
            if (currentContact === -1)
                contactView.model.append(fullName, address, city, number)
            else
                contactView.model.set(currentContact, fullName, address, city, number)
            */
        }
    }
}
