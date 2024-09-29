import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: login
    width: login.parent.width
    height: login.parent.width
    Rectangle{
        id: rectangle1
        width: parent.width/3
        height: parent.height/2
        color: "transparent"
        anchors.centerIn: parent
        Column{
            id: loginColumn
            spacing: login.height/10
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
            Row{
                spacing: usernameEntry.width/3
                Rectangle{
                    id: ok
                    width: login.width/10
                    height: login.height/10
                    color: "transparent"
                    radius: width/2
                    border.color: "green"
                    border.width:2
                    Text {
                        id: loginButton
                        text:"LOGIN"
                        font.pixelSize: ok.width / 5
                        anchors.centerIn: parent
                        color: "green"
                    }
                    MouseArea{
                        anchors.fill: ok
                        cursorShape: Qt.PointingHandCursor
                        onEntered: {
                            loginButton.color="mediumseagreen"
                            ok.border.color="mediumseagreen"
                        }
                        onExited: {
                            loginButton.color="green"
                            ok.border.color="green"
                        }
                        onClicked: {

                                if (usernameEntry.text === "" || passwordEntry.text === "") {
                                    popup.imageUrl = "popuplogos\\errormessage.png"
                                    popup.message = "Username or password cannot be empty!"
                                    popupMessage.color="seashell"
                                    popupMessage.font.pixelSize=Math.min(popupImage.width,popupImage.height )/8
                                    popup.visible = true
                                           } else {
                                             if(backend.loginManager(usernameEntry.text,passwordEntry.text)){
                                                 popup.imageUrl = "popuplogos\\loginsucess.png"
                                                 popup.message = "login Sucess"
                                                 poprectangle.color="seashell"
                                                 popupMessage.color="black"
                                                 popup.visible = true
                                             }else{
                                                 popup.imageUrl = "popuplogos\\errormessage.png"
                                                 popup.message = "login Failed!!!!"
                                                 poprectangle.color="red"
                                                 popupMessage.color="seashell"
                                                 popup.visible = true
                                             }
                                    }

                        }
                    }
                }

                Rectangle{
                    id: cancel
                    width: login.width/10
                    height: login.height/10
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
            opacity: 0.9
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
                    wrapMode: Text.Wrap
                    font.pixelSize: Math.min(popupImage.width,popupImage.height )/5
                    font.bold: true
                    height: implicitHeight
                }
            }
        }
    }

}
