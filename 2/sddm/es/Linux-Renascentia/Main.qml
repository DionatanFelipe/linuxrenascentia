import QtQuick
import QtQuick.Layouts
import QtQuick.Controls
import QtQuick.Window

Rectangle {
    id: root
    width: Screen.width
    height: Screen.height
    color: "#050403"

    property int sessionIndex: sessionSelector.currentIndex
    property alias userName: usernameField.text
    property alias password: passwordField.text
    property bool loginError: false

    Component.onCompleted: {
    if (userModel) {
        if (userModel.lastUser) {
            usernameField.text = userModel.lastUser
            passwordField.forceActiveFocus()
        } else if (userModel.count > 0) {
            usernameField.text = userModel.get(0).name
            passwordField.forceActiveFocus()
        }
    }
}

    // Fundo
    Image {
        id: background
        source: "assets/background.png"
        anchors.fill: parent
        opacity: 0.60
        fillMode: Image.PreserveAspectCrop
    }

    // Overlay
    Rectangle {
        anchors.fill: parent
        color: "#00000055"
    }

    // Login
    ColumnLayout {
        anchors.centerIn: parent
        spacing: 18

        Column {
            Layout.alignment: Qt.AlignHCenter
            spacing: 10

            Text {
                text: root.loginError ? "ACCESO DENEGADO" : "Bienvenido"
                color: root.loginError ? "#fffbe6" : "#f5f1e6"
                font.pixelSize: 34
                font.family: "DejaVu Serif"
                font.bold: true
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
            }

            // Mensagem de erro com destaque
            Rectangle {
                visible: root.loginError
                color: "#c95a3aAA"
                radius: 6
                anchors.horizontalCenter: parent.horizontalCenter
                width: 280
                height: 30

                Text {
                    anchors.centerIn: parent
                    text: "Usuario o contraseña incorrectos"
                    color: "#fffbe6"
                    font.pixelSize: 14
                    font.family: "Conectada"
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
            }
        }

        // Campo usuário
        TextField {
            id: usernameField
            placeholderText: "Usuario"
            color: "#f5f1e6"
            placeholderTextColor: "#a3a18a"
            font.family: "DejaVu Serif"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 300
            background: Rectangle {
                color: "#1b1f1dDD" // transparente legível
                border.color: "#cd7f32"
                border.width: 1
                radius: 6
            }
            selectionColor: "#cd7f32" // cobre
            selectedTextColor: "#f5f1e6"
            onTextChanged: root.loginError = false
        }

        // Campo senha
        TextField {
            id: passwordField
            placeholderText: "Contraseña"
            echoMode: TextInput.Password
            color: "#f5f1e6"
            placeholderTextColor: "#a3a18a"
            font.family: "DejaVu Serif"
            Layout.alignment: Qt.AlignHCenter
            Layout.preferredWidth: 300
            background: Rectangle {
                color: "#1b1f1dDD"
                border.color: "#cd7f32"
                border.width: 1
                radius: 6
            }
            selectionColor: "#cd7f32"
            selectedTextColor: "#f5f1e6"
            Keys.onPressed: (event) => {
                if (event.key === Qt.Key_Return) loginButton.clicked()
            }
            onTextChanged: root.loginError = false
        }

        // Botão login
Button {
    id: loginButton
    text: "Iniciar sesión"
    Layout.alignment: Qt.AlignHCenter
    Layout.preferredWidth: 150
    background: Rectangle {
        color: parent.pressed ? "#2a1e1a" : parent.hovered ? "#3a2a25" : "#1b1f1dFF"
        border.color: "#cd7f32"
        border.width: 1
        radius: 6
    }
    contentItem: Text {
        text: "Iniciar sesión"
        color: "#f5f1e6"
        font.family: "DejaVu Serif"
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

// Conexão para falha de login
Connections {
    target: sddm
    onLoginFailed: {
        root.loginError = true
        passwordField.text = "" // opcional: limpa senha ao errar
    }
}
    }

    // Session selector
    ComboBox {
        id: sessionSelector
        model: sessionModel
        textRole: "name"
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.margins: 20
        width: 220
        background: Rectangle {
            color: "#1b1f1dFF"
            border.color: "#cd7f32"
            border.width: 1
            radius: 6
        }
        contentItem: Text {
            text: sessionSelector.displayText
            color: "#f5f1e6"
            font.family: "DejaVu Serif"
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        popup: Popup {
            width: sessionSelector.width
            y: {
                var spaceBelow = Screen.height - (sessionSelector.y + sessionSelector.height)
                var spaceAbove = sessionSelector.y
                var popupHeight = sessionSelector.count * 40
                return spaceBelow < popupHeight && spaceAbove > spaceBelow ? -popupHeight : sessionSelector.height
            }
            background: Rectangle {
                color: "#1b1f1dFF"
                border.color: "#cd7f32"
            }
            contentItem: ListView {
                model: sessionSelector.popup.visible ? sessionSelector.delegateModel : null
                delegate: ItemDelegate {
                    width: sessionSelector.width
                    height: 40
                    contentItem: Text {
                        text: model.name
                        color: "#f5f1e6"
                        font.family: "DejaVu Serif"
                    }
                    background: Rectangle {
                        color: highlighted ? "#2a1e1a" : "#1b1f1dFF"
                    }
                }
            }
        }
    }

    // Power buttons
    Row {
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.margins: 20
        spacing: 10
        Button {
            width: 40
            height: 40
            background: Rectangle {
                color: parent.hovered ? "#3a2a25" : "#1b1f1dFF"
                border.color: "#cd7f32"
                radius: 6
            }
            contentItem: Text {
                text: "⏻"
                color: "#f5f1e6"
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            onClicked: sddm.powerOff()
        }
        Button {
            width: 40
            height: 40
            background: Rectangle {
                color: parent.hovered ? "#3a2a25" : "#1b1f1dFF"
                border.color: "#cd7f32"
                radius: 6
            }
            contentItem: Text {
                text: "↻"
                color: "#f5f1e6"
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
            onClicked: sddm.reboot()
        }
    }
}
