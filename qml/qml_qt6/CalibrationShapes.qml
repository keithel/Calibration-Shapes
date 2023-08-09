// Import the standard GUI elements from QtQuick
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

// Imports the Uranium GUI elements, which are themed for Cura.
import UM 1.6 as UM

// Imports the Cura GUI elements.
import Cura 1.7 as Cura


// UM.Dialog
// Dialog
ApplicationWindow
{
    id: base

    property variant catalog: UM.I18nCatalog { name: "calibration" }

    title: catalog.i18nc("@title", "Calibration Shapes")

    color: "#fafafa" //Background color of cura: #fafafa

    // NonModal like that the dialog to block input in the main window
    modality: Qt.NonModal

    // WindowStaysOnTopHint to stay on top
    flags: Qt.FramelessWindowHint | Qt.WindowStaysOnTopHint | Qt.WindowCloseButtonHint

    // Setting the dimensions of the dialog window
    width: 250
    height: 120
    minimumWidth: 250
    minimumHeight: 120
    visible: true

    // Position of the window
    x: Screen.width*0.5 - width - 50
    y: 400 

    // Define a Window a border (Red for) and a background color
    background: Rectangle {
        id: bg_rect
        anchors.fill: parent
        color: "#fff"
        border.color: "#D22"
        border.width: 3
        radius: 4
    }

    // Connecting our variable to the computed property of the manager
    property string userInfoText: manager.userInfoText

	property string sizeInput: manager.sizeInput

    header: RowLayout {
        spacing: 15

        // fillWidth so the X is on the right
        Label {
            text: catalog.i18nc("@label", "Calibration Part Default Size")
            Layout.fillWidth: true
            Layout.topMargin: 10
            Layout.leftMargin: 10
            Layout.bottomMargin: 5
        }

        // Button for closing the dialogbox
        Button
        {
            id: close_button
            text: "<font color='#ffffff'>" + "✖" + "</font>"
            width: 25
            height: 25

            Layout.preferredWidth: 25
            Layout.topMargin: 10
            Layout.rightMargin: 10
            Layout.bottomMargin: 5

            ToolTip.delay: 2000
            ToolTip.timeout: 1000
            ToolTip.visible: hovered
            ToolTip.text: qsTr("Close this dialog box")

            background: Rectangle {
                implicitWidth: 100
                implicitHeight: 25
                radius: 3
                color: "#D22"
            }

            onClicked:
            {
                base.close();
            }
        }
    }

    ColumnLayout {
        anchors.centerIn: parent
        anchors.margins: 10

        //Textfield for User Messages
        Text
        {
            id: user_text

            Layout.alignment: Qt.AlignHCenter

            width: 200
            text: userInfoText
            font.family: "Arial"
            font.pointSize: 10
            //The color gets overwritten by the html tags added to the text
            color: "black"

            wrapMode: Text.Wrap
        }

        RowLayout {
            // Label "Size: "
            Label
            {
                id: label_size
                text: catalog.i18nc("@label", "Size:")
                font.family: "Arial"
                font.pointSize: 12
                color: "#131151"
            }

//            TextField {
//                width: 90
//                text: sizeInput
//                // "ie. 20.0"
//
//                font.family: "Arial"
//                font.pointSize: 12
//            }
//            //User input of height
            UM.TextFieldWithUnit
            {
                id: size_input
                width: 90
                text: sizeInput
                // "ie. 20.0"

                font.family: "Arial"
                font.pointSize: 12

                unit: "mm"

                // Validate entered value
                Keys.onReturnPressed:
                {
                    event.accepted = true
                }

                // Return the new entered value
                Keys.onReleased:
                {
                    manager.sizeEntered(size_input.text)
                }

                validator: FloatValidator {}
            }
        }
    }

}
