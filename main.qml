import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    id: window
    width: 640
    height: 480
    visible: true
    title: qsTr("GroceryMadeEasy")

    Image {
        id: loginBackground
        source: "groceryLogo.png"
        anchors.fill: parent
        fillMode: Image.PreserveAspectFit
        opacity: 0.3
    }

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: menuPage
    }

    Component {
        id: menuPage
        Item {
            id: menuageitem

            Column {
                id: buttonsColumn
                anchors.centerIn: parent
                spacing: 20

                // Rectangle{
                //     id: logoHolder
                //     width: (window.width-window.height)/2
                //     height:( window.width-window.height)/2
                //     anchors.horizontalCenter: parent.horizontalCenter
                //     color: "transparent"
                //     Image {
                //         id: logo
                //         source: "logo.png"
                //         anchors.fill: parent
                //         fillMode: Image.PreserveAspectFit
                //     }
                // }
                Rectangle{
                    id: loginbutton
                    width: window.width/3
                    height: window.height/10
                    color: "transparent"
                    radius: width/2
                    border.color: "green"
                    border.width:2
                    Text {
                        id: logintext
                        text:"LOGIN"
                        font.pixelSize:loginbutton.width / 10
                        anchors.centerIn: parent
                        color: "green"
                    }
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onEntered: {
                            logintext.color="mediumseagreen"
                            loginbutton.border.color="mediumseagreen"
                        }
                        onExited: {
                            logintext.color="green"
                            loginbutton.border.color="green"
                        }
                        onClicked:{
                            stackView.push(loginPage)
                        }
                    }
                }

                Rectangle{
                    id: registerbutton
                    width: window.width/3
                    height: window.height/10
                    color: "transparent"
                    radius: width/2
                    border.color: "green"
                    border.width:2
                    Text {
                        id: registertext
                        text:"REGISTER"
                        font.pixelSize:registerbutton.width / 10
                        anchors.centerIn: parent
                        color: "green"
                    }
                    MouseArea{
                        anchors.fill: parent
                        cursorShape: Qt.PointingHandCursor
                        onEntered: {
                            registertext.color="mediumseagreen"
                            registerbutton.border.color="mediumseagreen"
                        }
                        onExited: {
                            registertext.color="green"
                            registerbutton.border.color="green"
                        }
                        onClicked: stackView.push(registerPage)
                    }
                }
            }

        }
    }

    Component{
        id: loginPage
        Loader{
            source: "loginPage.qml"
        }
    }

    Component{
        id: registerPage
        Loader{
            source: "registerPage.qml"
        }
    }
}
