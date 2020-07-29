import QtQuick 2.12
import QtGraphicalEffects 1.12

Rectangle {
    id: control

    property var mainColor: 'orange'
    property alias source: icon.source

    property bool press: false
    property bool hover: false

    signal pressed()
    signal hovered();

    clip: true;
    color: 'Transparent'

    Image {
        id: icon
        anchors.fill: parent
        source: ""
    }

    ColorOverlay
    {
        anchors.fill: icon
        source: icon
        color: control.press ? Qt.darker(control.mainColor,1.1) :
                               control.hover ? Qt.lighter(control.mainColor,1.3)
                                            : control.mainColor;
    }

    MouseArea {
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true

        onPressed: {
            control.pressed();
            control.press = true;
        }
        onReleased: control.press = false;

        onEntered: {
            control.hovered();
            control.hover = true;
        }
        onExited: control.hover = false;
    }

    Behavior on opacity {
        NumberAnimation{
            duration: 300
        }
    }
}
