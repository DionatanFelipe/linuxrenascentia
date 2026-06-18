import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window

Rectangle {
    id: root
    width: Screen.width
    height: Screen.height
    color: "#2B2A24"

    property int sessionIndex: sessionSelector.currentIndex
    property alias userName: usernameField.text
    property alias password: passwordField.text
    property bool loginError: false
    property bool lastUserLoaded: false  // <-- ADICIONE ESTA LINHA

    // Carrega o último usuário ao iniciar
    Component.onCompleted: {
        if (userModel.lastUser && !lastUserLoaded) {  // <-- MUDE DE sddm.lastUser PARA userModel.lastUser
            usernameField.text = userModel.lastUser   // <-- MUDE AQUI TAMBÉM
            lastUserLoaded = true
            passwordField.forceActiveFocus()
        }
    }

    // Resto do seu código continua IGUAL...
    Image {
        id: background
        source: "assets/background.png"
        anchors.fill: parent
        opacity: 0.60
        fillMode: Image.PreserveAspectCrop
    }

    Rectangle {
        anchors.fill: parent
        color: "#00000077"
    }

    ColumnLayout {
        anchors.centerIn: parent
        spacing: 20

        Column {
            Layout.alignment: Qt.AlignHCenter
            spacing: 12

            Text {
                text: root.loginError ? "ACCESS·DENIED" : "Welcome"
                color: "#F0EAD6"
                font.pixelSize: 36
                font.family: "EB Garamond Italic"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Rectangle {
                visible: root.loginError
                radius: 5
                anchors.horizontalCenter: parent.horizontalCenter
                width: 280
                height: 32
                color: "#5C4B3C"
                border.color: "#A67C52"
                border.width: 1

                Text {
                    anchors.centerIn: parent
                    text: "Incorrect·username·or·password"
                    color: "#F0EAD6"
                    font.pixelSize: 14
                    font.family: "EB Garamond Italic"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        TextField {
            id: usernameField
            placeholderText: "Username"
            color: "#F0EAD6"
            placeholderTextColor: "#CFC5B0"
            font.family: "EB Garamond Italic"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 300
            background: Rectangle {
                radius: 6
                border.color: "#A67C52"
                border.width: 1
                gradient: Gradient {
                    GradientStop { position: 0; color: "#3D372B" }
                    GradientStop { position: 1; color: "#2B2A24" }
                }
            }
            selectionColor: "#CFA05D"
            selectedTextColor: "#F0EAD6"
            onTextChanged: root.loginError = false
        }

        TextField {
            id: passwordField
            placeholderText: "Password"
            echoMode: TextInput.Password
            color: "#F0EAD6"
            placeholderTextColor: "#CFC5B0"
            font.family: "EB Garamond Italic"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 300
            background: Rectangle {
                radius: 6
                border.color: "#A67C52"
                border.width: 1
                gradient: Gradient {
                    GradientStop { position: 0; color: "#3D372B" }
                    GradientStop { position: 1; color: "#2B2A24" }
                }
            }
            selectionColor: "#CFA05D"
            selectedTextColor: "#F0EAD6"
            Keys.onPressed: (event) => {
                if (event.key === Qt.Key_Return) loginButton.clicked()
            }
            onTextChanged: root.loginError = false
        }

        Button {
            id: loginButton
            text: "Log In"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 150
            hoverEnabled: true
            background: Rectangle {
                radius: 6
                border.color: "#A67C52"
                border.width: 1
                gradient: Gradient {
                    GradientStop { position: 0; color: loginButton.pressed ? "#5C4B3C" : loginButton.hovered ? "#504332" : "#3D372B" }
                    GradientStop { position: 1; color: loginButton.pressed ? "#4A3D2F" : loginButton.hovered ? "#41392F" : "#2B2A24" }
                }
            }
            contentItem: Text {
                text: "Log In"
                color: "#F0EAD6"
                font.family: "EB Garamond Italic"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            onClicked: {
                if(usernameField.text === "" || passwordField.text === "") {
                    root.loginError = true
                } else {
                    root.loginError = false
                    sddm.login(usernameField.text, passwordField.text, sessionIndex)
                }
            }
        }

        Connections {
            target: sddm
            onLoginFailed: {
                root.loginError = true
                passwordField.text = ""
            }
        }
    }

    ComboBox {
        id: sessionSelector
        model: sessionModel
        textRole: "name"
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 20
        width: 220

        background: Rectangle {
            id: comboBg
            radius: 6
            border.color: "#A67C52"
            border.width: 1
            gradient: Gradient {
                GradientStop { position: 0; color: sessionSelector.pressed ? "#5C4B3C" : sessionSelector.hovered ? "#4A3D2F" : "#3D372B" }
                GradientStop { position: 1; color: sessionSelector.pressed ? "#4A3D2F" : sessionSelector.hovered ? "#3D372B" : "#2B2A24" }
            }
        }

        contentItem: Text {
            text: sessionSelector.displayText
            color: "#F0EAD6"
            font.family: "EB Garamond Italic"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }

        popup: Popup {
            width: sessionSelector.width

            background: Rectangle {
                color: "#2B2A24"
                border.color: "#A67C52"
                radius: 6
            }

            contentItem: ListView {
                anchors.fill: parent
                model: sessionSelector.model

                delegate: Item {
                    width: parent.width
                    height: 40

                    property bool hovered: false

                    Rectangle {
                        anchors.fill: parent
                        color: hovered ? "#4A3D2F" : "#3D372B"
                    }

                    Text {
                        anchors.centerIn: parent
                        text: model.name
                        color: "#F0EAD6"
                        font.family: "EB Garamond Italic"
                    }

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: hovered = true
                        onExited: hovered = false
                        onClicked: {
                            sessionSelector.currentIndex = index
                            sessionSelector.popup.close()
                        }
                    }
                }
            }

            Component.onCompleted: {
                var popupHeight = sessionSelector.model.count * 40
                var spaceBelow = Screen.height - (sessionSelector.y + sessionSelector.height)
                if (spaceBelow < popupHeight) {
                    y = -popupHeight
                } else {
                    y = sessionSelector.height
                }
            }
        }
    }

    Row {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 20
        spacing: 10

        Button {
            id: powerOffButton
            width: 40
            height: 40
            hoverEnabled: true
            background: Rectangle {
                radius: 6
                border.color: "#A67C52"
                border.width: 1
                gradient: Gradient {
                    GradientStop { position: 0; color: powerOffButton.pressed ? "#5C4B3C" : powerOffButton.hovered ? "#504332" : "#3D372B" }
                    GradientStop { position: 1; color: powerOffButton.pressed ? "#4A3D2F" : powerOffButton.hovered ? "#41392F" : "#2B2A24" }
                }
            }
            contentItem: Text {
                text: "⏻"
                color: "#F0EAD6"
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            onClicked: sddm.powerOff()
        }

        Button {
            id: rebootButton
            width: 40
            height: 40
            hoverEnabled: true
            background: Rectangle {
                radius: 6
                border.color: "#A67C52"
                border.width: 1
                gradient: Gradient {
                    GradientStop { position: 0; color: rebootButton.pressed ? "#5C4B3C" : rebootButton.hovered ? "#504332" : "#3D372B" }
                    GradientStop { position: 1; color: rebootButton.pressed ? "#4A3D2F" : rebootButton.hovered ? "#41392F" : "#2B2A24" }
                }
            }
            contentItem: Text {
                text: "↻"
                color: "#F0EAD6"
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            onClicked: sddm.reboot()
        }
    }
}
