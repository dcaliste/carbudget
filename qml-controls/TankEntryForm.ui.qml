import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Item {
    property alias kminput: kminput
    property alias quantityinput: quantityinput
    property alias priceinput: priceinput
    property alias unitpriceinput: unitpriceinput
    property alias cbfuelType: cbfuelType
    property alias cbstation: cbstation
    property alias fullinput: fullinput
    property alias noteinput: noteinput

    GridLayout {
        id: grid
        columns: 2
        property int minimumInputSize: 120

        Label {
            text: qsTr("Odometer")
            Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
        }

        TextField {
            id: kminput
            Layout.fillWidth: true
            Layout.minimumWidth: grid.minimumInputSize
            Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
            focus: true
            placeholderText: manager.car.distanceUnit
            validator: RegExpValidator {
                regExp: /^[0-9]{1,7}$/
            }
            inputMethodHints: Qt.ImhDigitsOnly | Qt.ImhNoPrediction
        }

        Label {
            id: quantitylbl
            Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
            text: qsTr("Quantity")
        }

        TextField {
            id: quantityinput
            Layout.fillWidth: true
            Layout.minimumWidth: grid.minimumInputSize
            Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
            placeholderText: quantitylbl.text
            validator: RegExpValidator {
                regExp: /^[0-9\.,]{1,6}$/
            }
            inputMethodHints: Qt.ImhDigitsOnly | Qt.ImhNoPrediction
        }

        Label {
            id: pricelbl
            Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
            text: qsTr("Total Price")
        }

        TextField {
            id: priceinput
            Layout.fillWidth: true
            Layout.minimumWidth: grid.minimumInputSize
            Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
            placeholderText: pricelbl.text
            validator: RegExpValidator {
                regExp: /^[0-9\.,]{1,7}$/
            }
            inputMethodHints: Qt.ImhDigitsOnly | Qt.ImhNoPrediction
        }

        Label {
            text: qsTr("Unit Price")
            Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
        }
        TextField {
            id: unitpriceinput
            Layout.fillWidth: true
            Layout.minimumWidth: grid.minimumInputSize
            Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
            validator: RegExpValidator {
                regExp: /^[0-9\.,]{1,6}$/
            }
            readOnly: true
        }

        Label {
            text: qsTr("Fuel Type")
            Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
        }
        ComboBox {
            id: cbfuelType
            Layout.fillWidth: true
            Layout.minimumWidth: grid.minimumInputSize
            Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
            model: manager.car.fuelTypes
            textRole: "name"
        }

        Label {
            text: qsTr("Station")
            Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
        }

        ComboBox {
            id: cbstation
            Layout.fillWidth: true
            Layout.minimumWidth: grid.minimumInputSize
            Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
            model: manager.car.stations
            textRole: "name"
        }

        Label {
            text: qsTr("Full tank")
            Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
        }

        Switch {
            id: fullinput
            Layout.fillWidth: true
            Layout.minimumWidth: grid.minimumInputSize
            Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
        }

        Label {
            text: qsTr("Note")
            Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
        }
        TextArea {
            id: noteinput
            placeholderText: qsTr("Note")
            Layout.fillWidth: true
            Layout.minimumWidth: grid.minimumInputSize
            Layout.alignment: Qt.AlignLeft | Qt.AlignBaseline
        }
    }
}
