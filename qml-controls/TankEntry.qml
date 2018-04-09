import QtQuick 2.4
import QtQuick.Controls 2.2
import harbour.carbudget 1.0

Dialog {
    id: dialog

    Menu {
        id: contextMenu
        MenuItem {
            text: qsTr("Manage stations")
            onClicked: {
                stackView.push("StationView.qml")
            }
        }
        MenuItem {
            text: qsTr("Manage fuel types")
            onClicked: {
                stackView.push("FueltypeView.qml")
            }
        }
    }



    signal finished(string fullName, string address, string city, string number)

    function createTank() {
        form.kminput.clear();
        form.quantityinput.clear();
        form.priceinput.clear();
        form.unitpriceinput.clear();
        form.cbfuelType.currentIndex = 0
        form.cbstation.currentIndex = 0
        form.fullinput.checked = true
        form.noteinput.clear()

        dialog.title = qsTr("Add Tank");
        dialog.open();
    }

    function editTank(tank) {
        form.kminput.text = tank.kminput;
        form.quantityinput.text = tank.quantityinput;
        form.priceinput.text = tank.priceinput;
        form.unitpriceinput.text = tank.unitpriceinput;
                /*
        form.cbfuelType.currentIndex = 0
        form.cbstation.currentIndex = 0
        form.fullinput.checked = true
        form.noteinput.text =
        */



        dialog.title = qsTr("Edit Tank");
        dialog.open();
    }

    x: parent.width / 2 - width / 2
    y: parent.height / 2 - height / 2
    focus: true
    modal: true
    title: qsTr("Tank Entry")
    standardButtons: Dialog.Ok | Dialog.Cancel

    contentItem: TankEntryForm {
        id: form
    }

    onAccepted: finished(form.fullName.text, form.address.text, form.city.text, form.number.text)

    /*
    kminput {
        text: (tank.distance / manager.car.distanceunitfactor).toFixed(0)
    }

    quantityinput {
        text: tank.quantity
        onAccepted: {
            tank.quantity = text
        }
    }

    priceinput {
        text: tank.price
    }

    unitpriceinput {
        text: tank.pricePerUnit
    }
    */



    /*
    property alias quantityinput: quantityinput
    property alias priceinput: priceinput
    property alias unitpriceinput: unitpriceinput
    property alias cbfuelType: cbfuelType
    property alias cbstation: cbstation
    property alias fullinput: fullinput
    property alias noteinput: noteinput
    */
}
