/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the Qt Quick Controls 2 module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL3$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPLv3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or later as published by the Free
** Software Foundation and appearing in the file LICENSE.GPL included in
** the packaging of this file. Please review the following information to
** ensure the GNU General Public License version 2.0 requirements will be
** met: http://www.gnu.org/licenses/gpl-2.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.12
import QtQuick.Templates 2.12 as T
import QtQuick.Controls 2.12
import QtQuick.Controls.impl 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Controls.Material.impl 2.12

T.RoundButton {
    id: control
    property color disableColor: Material.buttonDisabledColor
    property bool realyDisabled: true
    property color myHintTextColor: Material.hintTextColor
    property color myPrimaryHighlightedTextColor: Material.primaryHighlightedTextColor
    property color myForeground: Material.foreground
    property color myHighlightedButtonColor: Material.highlightedButtonColor
    property color myButtonColor: Material.buttonColor
    property color myHover :Material.rippleColor
    property int  cursorType: Qt.ArrowCursor


    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    topInset: 6
    leftInset: 6
    rightInset: 6
    bottomInset: 6
    padding: 12
    spacing: 6

    icon.width: 24
    icon.height: 24
    icon.color: !enabled ? Material.hintTextColor :
        flat && highlighted ? Material.accentColor :
        highlighted ? Material.primaryHighlightedTextColor : Material.foreground

//    Material.elevation: flat ? control.down || control.hovered ? 2 : 0
//                             : control.down ? 12 : 6
    Material.background: flat ? "transparent" : undefined
    hoverEnabled: true
    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font: control.font
        color: !control.enabled ? myHintTextColor :
            control.flat && control.highlighted ? control.Material.accentColor :
            control.highlighted ? myPrimaryHighlightedTextColor : myForeground
    }

    // TODO: Add a proper ripple/ink effect for mouse/touch input and focus state
    background: Rectangle {
        implicitWidth: control.Material.buttonHeight
        implicitHeight: control.Material.buttonHeight


        radius: control.radius
        color: !control.enabled ? disableColor
            : control.checked || control.highlighted ? myHighlightedButtonColor : myButtonColor

        Rectangle {

            width: parent.width
            height: parent.height
            radius: control.radius
            visible: control.hovered || control.visualFocus
            color: myHover
        }

        Rectangle {
            width: parent.width
            height: parent.height
            radius: control.radius
            visible: control.down
            color: control.Material.rippleColor
        }


        // The layer is disabled when the button color is transparent so that you can do
        // Material.background: "transparent" and get a proper flat button without needing
        // to set Material.elevation as well
        layer.enabled: control.enabled && control.Material.buttonColor.a > 0
//        layer.effect: ElevationEffect {
//            elevation: control.Material.elevation
//        }

        MouseArea
        {
            anchors.fill: parent
            cursorShape: cursorType
            hoverEnabled: true
            onPressed:  mouse.accepted = false
        }
        Ripple {
            clipRadius: radius
            width: parent.width
            height: parent.height

            pressed: control.pressed
            anchor: control
            active: control.down || control.visualFocus || control.hovered
            color: control.flat
                   && control.highlighted ? control.Material.HighlightedRippleColor : control.Material.rippleColor
        }


    }
}
