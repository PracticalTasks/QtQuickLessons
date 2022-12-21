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

    //Получаемый ввод из TextField - ов
    property string strA
    property string strB
    property string strC
    //Площадь треугольника
    property string strP

    property string strX
    property string strY


    function getValues(str){
        var idxDot
        idxDot = str.indexOf(',')
        strX = str.substring(0, idxDot)
        strY = str.substring(idxDot + 2, str.lenght)
    }

    function calculateSide(){
        var isCoordX = parseInt(strX, 10)
        var isCoordY = parseInt(strY, 10)
        var calculateRes

        if(isCoordX > isCoordY){
            if((isCoordX - isCoordY) > 0){
                        return isCoordX - isCoordY
                    }
            else{
                calculateRes = Math.pow(isCoordY, 2)
                return Math.sqrt(calculateRes) + isCoordX
            }
        }
        else if(isCoordX < isCoordY){
            if((isCoordY - isCoordX) > 0){
                return isCoordY - isCoordX
            }
            else{
                calculateRes = Math.pow(isCoordX, 2)
                return Math.sqrt(calculateRes) + isCoordY
            }
        }

        return 0
}

    function areaCalculation(){
        var A, B, C, p

        getValues(strA)
        A = calculateSide()

        getValues(strB)
        B = calculateSide()

        getValues(strC)
        C = calculateSide()

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
                placeholderText: qsTr("x, y")
            }
        }
        Label{
            text: "Сторона B"
            Layout.alignment: Qt.AlignTop
            TextField{
                id: sideB
                anchors.left: parent.left
                anchors.top: parent.bottom
                placeholderText: qsTr("x, y")
            }
        }
        Label{
            text: "Сторона C"
            Layout.alignment: Qt.AlignTop
            TextField{
                id: sideC
                anchors.left: parent.left
                anchors.top: parent.bottom
                placeholderText: qsTr("x, y")
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
