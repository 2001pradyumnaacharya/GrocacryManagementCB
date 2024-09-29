import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: register
    width: register.parent.width
    height: register.parent.width
    Rectangle{
        id: rectangle1
        width: parent.width/3
        height: parent.height/2
        color: "transparent"
        anchors.centerIn: parent
        Column{
            id: loginColumn
            spacing: register.height/10
            width: rectangle1.width
            anchors.centerIn: parent
            TextField{
                id: usernameEntry
                placeholderText:"UserName"
                width: parent.width-20
                height:rectangle1.height/10
            }
            TextField{
                id: passwordEntry
                placeholderText:"Password"
                width: parent.width-20
                height:rectangle1.height/10
                echoMode: TextField.Password
            }
            TextField{
                id: conformPasswordEntry
                placeholderText:"Conform Password"
                width: parent.width-20
                height:rectangle1.height/10
                echoMode: TextField.Password
            }
            Row{
                spacing: usernameEntry.width/3
                Rectangle{
                    id: ok
                    width: register.width/10
                    height: register.height/10
                    color: "transparent"
                    radius: width/2
                    border.color: "green"
                    border.width:2
                    Text {
                        id: registerButton
                        text:"REGISTER"
                        font.pixelSize: ok.width / 5
                        anchors.centerIn: parent
                        color: "green"
                    }
                    MouseArea{
                        anchors.fill: ok
                        cursorShape:Qt.PointingHandCursor

                        onEntered: {
                            registerButton.color="mediumseagreen"
                            ok.border.color="mediumseagreen"
                        }
                        onExited: {
                            registerButton.color="green"
                            ok.border.color="green"
                        }
                        onClicked: {
                            if (usernameEntry.text === "" || passwordEntry.text === "" || conformPasswordEntry.text === "") {
                                popup.imageUrl = "popuplogos\\errormessage.png"
                                popup.message = "Username or password or conform password cannot be empty!"
                                popupMessage.color="seashell"
                                popupMessage.font.pixelSize=Math.min(popupImage.width,popupImage.height )/10
                                popup.visible = true
                            } else if (passwordEntry.text !== conformPasswordEntry.text) {
                                popup.imageUrl = "popuplogos\\errormessage.png"
                                popup.message = "Passwords do not match!"
                                popupMessage.color="seashell"
                                popupMessage.font.pixelSize=Math.min(popupImage.width,popupImage.height )/6
                                popup.visible = true
                            } else {
                                if (backend.registerManager(usernameEntry.text, passwordEntry.text, conformPasswordEntry.text)) {
                                    popup.imageUrl = "popuplogos\\register.png"
                                    popup.message = "Registred sucessfully"
                                    poprectangle.color="#f8f8ff"
                                    popupMessage.color="black"
                                    popupMessage.font.pixelSize=Math.min(popupImage.width,popupImage.height )/6
                                    popup.open()
                                } else {
                                    popup.imageUrl = "popuplogos\\errormessage.png"
                                    popup.message = "Registration Failed!!!!"
                                    popupMessage.color="seashell"
                                    popup.open()
                                }
                            }
                        }
                    }
                }

                Rectangle{
                    id: cancel
                    width: register.width/10
                    height: register.height/10
                    color: "transparent"
                    radius: width/2
                    border.color: "green"
                    border.width:2
                    Text {
                        id: cancelButton
                        text:"CANCEL"
                        font.pixelSize:ok.width / 5
                        anchors.centerIn: parent
                        color: "green"
                    }
                    MouseArea{
                        anchors.fill: cancel
                        cursorShape: Qt.PointingHandCursor
                        onEntered: {
                            cancelButton.color="mediumseagreen"
                            cancel.border.color="mediumseagreen"
                        }
                        onExited: {
                            cancelButton.color="green"
                            cancel.border.color="green"
                        }
                        onClicked: stackView.pop()
                    }
                }
            }
            }
        }

    Popup {
        id: popup
        width: parent.width/2
        height: parent.height/2
        modal: true
        visible: false
        closePolicy: Popup.CloseOnPressOutside
        anchors.centerIn: parent

        property string imageUrl: ""
        property string message: ""

        Rectangle {
            id: poprectangle
            width: parent.width
            height: parent.height
            color: "red"
            Column {
                anchors.centerIn: parent
                spacing: 10

                Image {
                    id: popupImage
                    source: popup.imageUrl
                    width: poprectangle.width/3
                    height: poprectangle.height/3
                    fillMode: Image.PreserveAspectFit
                    anchors.horizontalCenter: parent.horizontalCenter
                }

                Text {
                    id: popupMessage
                    text: popup.message
                    anchors.horizontalCenter: parent.horizontalCenter
                    font.bold: true
                }
            }
        }
    }
}
