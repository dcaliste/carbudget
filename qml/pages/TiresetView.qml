/**
 * CarBudget, Sailfish application to manage car cost
 *
 * Copyright (C) 2014 Fabien Proriol, 2015 Thomaas Michel
 *
 * This file is part of CarBudget.
 *
 * CarBudget is free software: you can redistribute it and/or modify it under the terms of the
 * GNU General Public License as published by the Free Software Foundation, either version 3 of the
 * License, or (at your option) any later version.
 *
 * CarBudget is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY;
 * without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
 *
 * See the GNU General Public License for more details. You should have received a copy of the GNU
 * General Public License along with CarBudget. If not, see <http://www.gnu.org/licenses/>.
 *
 * Authors: Fabien Proriol, Thomas Michel
 */

import QtQuick 2.0
import Sailfish.Silica 1.0
import harbour.carbudget 1.0

Dialog {
    allowedOrientations: Orientation.All
    SilicaListView {
        id: tiresetlist
        PullDownMenu {
            MenuItem {
                text: qsTr("Add new tire set")
                onClicked: pageStack.push(Qt.resolvedUrl("TiresetEntry.qml"))
                }
            MenuItem {
                text: qsTr("Show history")
                onClicked: pageStack.push(Qt.resolvedUrl("TiremountView.qml"))
            }
        }

        VerticalScrollDecorator {}

        header: PageHeader {
            title: qsTr("Tire Set List")
        }

        anchors.fill: parent
        leftMargin: Theme.paddingMedium
        rightMargin: Theme.paddingMedium
        onModelChanged: fillListModel()
        model: listModel

        delegate: ListItem {
            id: listDelegate
            width: parent.width - Theme.paddingMedium - Theme.paddingMedium
            showMenuOnPressAndHold: true
            menu: ContextMenu {
                MenuItem {
                    text: qsTr("Modify")
                    onClicked: pageStack.push(Qt.resolvedUrl("TiresetEntry.qml"), { tireset: model.modelData })
                }
                MenuItem{
                    text: qsTr("Add tires")
                    enabled: model.modelData.tires_associated < manager.car.nbtire? true:false
                    onClicked:
                    {
                        var p = pageStack.push(Qt.resolvedUrl("TireEntry.qml"), { tireset: model.modelData })
                        p.accepted.connect(function() {
                            fillListModel()
                        })
                    }
                }
                MenuItem{
                    text: qsTr("Mount")
                    enabled: model.modelData.mountable? true:false
                    onClicked:
                    {
                        var p = pageStack.push(Qt.resolvedUrl("TireMount.qml"), { tireset: model.modelData })
                        p.accepted.connect(function() {
                            fillListModel()
                        })
                    }
                }            }

/*
                MenuItem {
                    text: qsTr("Remove")
                    onClicked: {
                        remorseAction(qsTr("Deleting"), function() {
                            mListItemanager.car.delCosttype(model.modelData)
                        })
                    }
                }
                */
            onClicked: pageStack.push(Qt.resolvedUrl("TireView.qml"), { tireset: model.modelData })

            Column {
                width: parent.width

                Row {
                    width: parent.width

                    Text {
                        text: model.modelData.id + ": " + model.modelData.name;
                        font.family: Theme.fontFamily
                        font.pixelSize: Theme.fontSizeMedium
                        color: Theme.primaryColor
                        width: parent.width
                    }
                }
            }
        }
    }
    ListModel {
        id:listModel
    }
    function fillListModel()
    {
        var tiresetlist = manager.car.tiresets;
        listModel.clear()
        for (var i = 0;i < tiresetlist.length ;i++)
        {
            listModel.append({"tireset" : tiresetlist[i]})
        }
    }
}