import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.3

Window {
    width: 400
    height: 150
    visible: true
    title: qsTr("Вычесление площади треугольника")
    color: "#e5ecef"
    property string strA
    property string strB
    property string strC
    property string strP

    function areaCalculation(){
    var A, B, C, p
    A = Number.fromLocaleString(strA)
    B = Number.fromLocaleString(strB)
    C = Number.fromLocaleString(strC)
    p = (A + B + C) / 2
    strP = Math.sqrt((p * (p - A)) * (p - B) * (p - C))
}

    RowLayout{
        anchors.fill: parent
        Label{
            Layout.alignment: Qt.AlignTop
            text: "Сторона A"
            TextField{
                id: sideA
                anchors.left: parent.left
                anchors.top: parent.bottom
                placeholderText: qsTr("Сторона A")
            }
        }
        Label{
            text: "Сторона B"
            Layout.alignment: Qt.AlignTop
            TextField{
                id: sideB
                anchors.left: parent.left
                anchors.top: parent.bottom
                placeholderText: qsTr("Сторона B")
            }
        }
        Label{
            text: "Сторона C"
            Layout.alignment: Qt.AlignTop
            TextField{
                id: sideC
                anchors.left: parent.left
                anchors.top: parent.bottom
                placeholderText: qsTr("Сторона C")
            }
        }
    }
    Label{
        id: result
        text: "Площадь треугольника равна: " + strP
        anchors.verticalCenter: parent.verticalCenter
    }

    Button{
        width: 400
        height: 45
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        text: "Результат"
        onClicked: {
            strA = sideA.getText(0, 10)
            strB = sideB.getText(0, 10)
            strC = sideC.getText(0, 10)
            areaCalculation()
        }
    }
}

