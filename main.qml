import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.12
import QtQuick.Controls.Material 2.12
import QtQuick.Layouts 1.12
import "CustomControls"

ApplicationWindow
{
    id: applicationWindow
    width: 1024
    height: 900
    visible: true
    title: qsTr("Open Store")
    onWidthChanged:
    {
        console.log("Width was changed")
        if (applicationWindow.width <= 1024)
            rowLayout_header.anchors.horizontalCenterOffset  = -80
        else
            rowLayout_header.anchors.horizontalCenterOffset = 0
        rowLayout_header.update()
    }
    Component.onCompleted:
    {
        console.log("Component completed application window")
        applicationWindow.widthChanged(applicationWindow.maximumWidth)

    }
    Flickable
    {
        id: flickable
        anchors.fill: parent
        contentHeight: rectangle_Footer.y + rectangle_Footer.height
        contentWidth: parent.width
        flickableDirection: Flickable.VerticalFlick
        anchors.bottomMargin: 0
        ScrollBar.vertical:  ScrollBar
        {
        }
        MouseArea
        {
            //need for webassembly ti return arrow cursor and search
            cursorShape: Qt.ArrowCursor
            anchors.fill: parent
        }

        ToolBar
        {
            id: toolBar

            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 10
            anchors.leftMargin: 0
            anchors.rightMargin: 0
            Image {
                id:image_logo
                width: 49
                height: 40
                anchors.left: parent.left
                anchors.top: parent.top
                source: "Images/Nike-logo-506c4872.png"
                anchors.topMargin: 0
                anchors.leftMargin: 20
                MouseArea
                {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                }
            }

            RowLayout
            {
                id: rowLayout_header
                y: 0
                height: 48
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
                spacing: 0
                ToolButton
                {
                    text: qsTr("??????????????")
                    Layout.fillWidth: false
                    flat: false
                    hoverEnabled: true
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    MouseArea
                    {
                        anchors.fill: parent
                        onPressed:  mouse.accepted = false
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
                    }

                }
                ToolButton
                {
                    text: qsTr("??????????????")
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    hoverEnabled: true
                    MouseArea
                    {
                        anchors.fill: parent
                        onPressed:  mouse.accepted = false
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
                    }
                }
                ToolButton
                {
                    text: qsTr("??????????????")
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    hoverEnabled: true
                    MouseArea
                    {
                        anchors.fill: parent
                        onPressed:  mouse.accepted = false
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
                    }
                }
                ToolButton
                {
                    text: qsTr("  ????????  ")
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                     hoverEnabled: true
                    MouseArea
                    {
                        anchors.fill: parent
                        onPressed:  mouse.accepted = false
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
                    }
                }
                ToolButton
                {
                    text: qsTr("????????????????????")
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    hoverEnabled: true
                    MouseArea
                    {
                        anchors.fill: parent
                        onPressed:  mouse.accepted = false
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
                    }
                }
                ToolButton
                {
                    text: qsTr("??????????????????")
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    hoverEnabled: true
                    MouseArea
                    {
                        anchors.fill: parent
                        onPressed:  mouse.accepted = false
                        cursorShape: Qt.PointingHandCursor
                        hoverEnabled: true
                    }
                }

            }

            Rectangle
            {
                id:rectangleSearch
                x: 1287
                y: 0
                width: 200
                height: 40
                anchors.right: button_like.left
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 5
                anchors.bottomMargin: 5
                anchors.rightMargin: 5


                SearchBox
                {
                    id:searchBox
                    anchors.fill: parent
                    searchInputTextBox.onActiveFocusChanged:
                    {
                            rectangle_grayScreen.visible = true
                            rectangle_BigSearch.visible = true
                            console.log("got focus")
                            animationSearchOpen.start()
                            searchBox_BigSearch.searchInputTextBox.focus = true

                    }

                    NumberAnimation
                    {
                        id: animationSearchOpen
                        target: rectangle_BigSearch
                        properties: "anchors.leftMargin"
                        running: false                        
                        to: rectangle_BigSearch.anchors.rightMargin
                        onFinished:
                        {
                            listView_SearchResult.visible = true
                            text_material_PopularRequest.visible = true
                        }
                    }
                    NumberAnimation {
                        id: animationSearchClose
                        target: rectangle_BigSearch
                        properties: "anchors.leftMargin"
                        running: false
                        duration: 100
                        to: applicationWindow.width - rectangle_BigSearch.anchors.rightMargin
                        onFinished:
                        {
                            rectangle_BigSearch.visible = false
                            rectangle_grayScreen.visible = false
                            listView_SearchResult.visible = false
                            text_material_PopularRequest.visible = false
                        }

                    }
                }
            }




            Material_RoundButton
            {
                id: button_like
                x: 1485
                icon.source: "qrc:/Images/baseline_favorite_border_black_24dp.png"
                anchors.right: button_cart.left
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.rightMargin: 10
                cursorType:Qt.PointingHandCursor
            }

            Material_RoundButton
            {
                id: button_cart
                x: 1555
                icon.source: "qrc:/Images/baseline_shopping_cart_black_24dp.png"
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 0
                anchors.rightMargin: 5
                cursorType:Qt.PointingHandCursor



            }



        }

        Image {
            id: d6df9ea8b3594dd2916daf88dc36c406
            height: 269
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: toolBar.bottom
            source: "Images/d6df9ea8-b359-4dd2-916d-af88dc36c406.webp"
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            anchors.topMargin: 55
            fillMode: Image.PreserveAspectFit
            MouseArea
            {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                hoverEnabled: true
                onPressed:  mouse.accepted = false
                onClicked:
                {
                    console.log("mouseArea d6df9ea8b3594dd2916daf88dc36c406 wwas clicked")  //use for click insted usuale onCliked from button
                }
            }



            Material_Button {
                id: button
                x: 611
                text: qsTr("????????????")
                anchors.top: text_ads_remark.bottom
                anchors.topMargin: 10
                font.capitalization: Font.MixedCase
                rightPadding: 20
                leftPadding: 20
                padding: 12
                topPadding: 12
                myRadius:20
                cursorType: Qt.PointingHandCursor
                anchors.horizontalCenterOffset: -53
                anchors.horizontalCenter: parent.horizontalCenter
                myHighlightedRippleColor: "#cec7c6"
                myButtonColor: "#ffffff"

            }

            Material_Button {
                id: button1
                x: 782
                text: qsTr("?????????????? ??????????*")
                anchors.top: text_ads_remark.bottom
                anchors.topMargin: 10
                font.capitalization: Font.MixedCase
                topPadding: 12
                bottomPadding: 12
                rightPadding: 20
                leftPadding: 20
                padding: 10
                anchors.horizontalCenterOffset: 106
                anchors.horizontalCenter: parent.horizontalCenter
                myRadius:20
                cursorType: Qt.PointingHandCursor
                myHighlightedRippleColor: "#cec7c6"
                myButtonColor: "#ffffff"

            }

            Text {
                id: text_ads_main
                x: 386
                y: 69
                width: 853
                height: applicationWindow.width >=1600 ? 100 : 37
                text: qsTr("???????????????????????????? ???????????? 10% ???? ????????????????????")
                anchors.verticalCenter: parent.verticalCenter
                font.pixelSize: applicationWindow.width >=1600 ? 48 : 32
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
                font.weight: Font.Bold
                anchors.verticalCenterOffset: -40
                anchors.horizontalCenterOffset: 0
                anchors.horizontalCenter: parent.horizontalCenter
            }

            Text {
                id: text_ads_remark
                x: 377
                text: qsTr("?????? ???????????? ?????????? Nike. ???????????? ?????????? ?????? JULY21 ?????? ???????????????????? ????????????*.")
                anchors.top: text_ads_main.bottom
                font.pixelSize: applicationWindow.width >=1600 ? 24 : 18
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.horizontalCenterOffset: 0
                anchors.verticalCenterOffset: -20
                anchors.topMargin: 10
            }
        }

        Text {
            id: text_News
            text: qsTr("??????????????")
            anchors.left: parent.left
            anchors.top: d6df9ea8b3594dd2916daf88dc36c406.bottom
            font.pixelSize: 36
            anchors.topMargin: 25
            anchors.leftMargin: 20
        }

        AnimatedImage {
            id: animatedImage
            height: 800
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: text_News.bottom
            source:"https://raw.githubusercontent.com/berkut998/berkut998.github.io/master/Images/y2mate.com%20-%20RUN%20Inspirational%20Running%20Video%20HD_1080p.gif"
            playing: true //applicationDirPath +"/Images/y2mate.com - RUN Inspirational Running Video HD_1080p.gif"
            cache: false
            anchors.topMargin: 20
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            Component.onCompleted:
            {
                console.log( applicationDirPath +"/Images/y2mate.com - RUN Inspirational Running Video HD_1080p.gif")
            }
        }

        Text {
            id: text_bestDay
            x: 696
            y: 1344
            text: qsTr("???????????? ????????")
            anchors.top: animatedImage.bottom
            font.pixelSize: 72
            font.weight: Font.Bold
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 25
        }

        Text {
            id: text_bestDayDescription
            y: 1424
            height: applicationWindow.width >= 1600 ? 115 : 180
            text: qsTr("?????? ?????????? ????????????, ?????????????????????? ?? ???????????? ?? ?????????????? ??????????????? ?????? ??????????????. ?? ?????????? ?????????? ???????????? ???? ???????????????????? ?????? ?????? ?? ???????? ????????. ?????? ???????????? ?????????? Nike ????????????, ????????????????, ???????? ???????????? ???????????? ???????? ?????????????????? ?????????????? ?????????????? ?? ?????????? ?????????????? ?? ???????????????? ??? ???????????? ?? ???????????????????? Nike.")
            elide: Text.ElideNone
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: text_bestDay.bottom
            font.pixelSize: 28
            verticalAlignment: Text.AlignTop
            lineHeightMode: Text.ProportionalHeight
            wrapMode: Text.WordWrap
            renderType: Text.QtRendering
            textFormat: Text.AutoText
            clip: false
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            anchors.topMargin: 20
        }

        Material_Button {
            id: button_More
            x: 727
            y: 1548
            text: qsTr("??????????????????")
            anchors.top: text_bestDayDescription.bottom
            font.capitalization: Font.MixedCase
            rightPadding: 20
            leftPadding: 20
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 20
            myRadius:20
            cursorType: Qt.PointingHandCursor
            Material.theme: Material.Dark
            myHighlightedRippleColor: "#cec7c6"
            myHighlightedButtonColor:"#cec7c6"
            myButtonColor:"#111111"
            myForeground: "#ffffff"

        }

        Text {
            id: text_equipment
            x: 669
            text: qsTr("???????????? ????????????????????")
            anchors.left: parent.left
            anchors.top: button_More.bottom
            font.pixelSize: 24
            anchors.topMargin: 10
            anchors.leftMargin: 20
        }

        ListView {
            id: listView_equipment
            height: width/3 +75
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: text_equipment.bottom
            anchors.topMargin: 20
            spacing: 10
            boundsBehavior: Flickable.StopAtBounds
            flickableDirection: Flickable.HorizontalFlick
            contentHeight: listView_equipment.height
            contentWidth: listView_equipment.width / 3
            orientation: ListView.Horizontal
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            ScrollBar.horizontal: ScrollBar {}


            delegate: Item {
                width: listView_equipment.width / 3
                height: listView_equipment.width / 3
                MouseArea
                {
                    cursorShape: Qt.PointingHandCursor
                    anchors.fill: parent
                    onClicked:
                    {
                        console.log("mouseArea favorite wwas clicked")  //use for click insted usuale onCliked from button
                    }
                }
                ColumnLayout {
                    id: columnLayout
                    anchors.fill: parent


                    Image {
                        id: image
                        source: imageURL
                        Layout.preferredHeight: parent.height
                        Layout.preferredWidth: parent.width
                        Layout.minimumHeight: 128
                        Layout.minimumWidth: 128
                        fillMode: Image.Stretch
                    }

                    Text {
                        id: text1
                        text: productName
                        font.pixelSize: 16
                        clip: true
                        Layout.fillWidth: true

                        Text {
                            id: text3
                            text: price
                            anchors.right: parent.right
                            font.pixelSize: 16
                            clip: true
                            anchors.rightMargin: 0
                        }
                    }

                    Text {
                        id: text2
                        color: "#757575"
                        text:decription
                        font.pixelSize: 16
                    }
                }

            }
            model: ListModel {
                ListElement {
                    price:"26 299 ???"
                    productName: "Nike Air Zoom Alphafly Flyknit"
                    imageURL: "Images/5eb1e502-225c-4510-9287-7d34909ae592.webp"
                    decription:"?????????????? ?????????? ?????? ?????????????? ???? ??????????"
                }
                ListElement {
                    price:"21 799 ???"
                    productName: "Nike ZoomX Vaporfly 2"
                    imageURL: "Images/1d5e08c6-cda9-4429-b5a7-92402299cc9e.webp"
                    decription:"?????????????? ?????????? ?????? ?????????????? ???? ??????????"
                }
                ListElement {
                    price:"29 799 ???"
                    productName: "Nike Sportswear"
                    imageURL: "Images/c96d46b2-b9f4-48f9-b81e-b8ca058e30a6.webp"
                    decription:"?????????????? ????????????"
                }
                ListElement {
                    price:"2 299 ???"
                    productName: "Nike Dri-FIT Race"
                    imageURL: "Images/3c664897-20e3-4cf9-8493-eb027c91b58d.webp"
                    decription:"?????????????? ?????????????? ??????????"
                }
                ListElement {
                    price:"5 999 ???"
                    productName: "Nike AeroSwift"
                    imageURL: "Images/31451dc2-07a9-43c4-bd73-8bfa1cf2f7f2.webp"
                    decription:"?????????????? ?????????????? ??????????"
                }


            }
        }

        Text {
            id: text_NewOpens1
            y: 2280
            text: qsTr("?????????? ????????????????")
            anchors.left: parent.left
            anchors.top: listView_equipment.bottom
            font.pixelSize: 24
            anchors.leftMargin: 20
            anchors.topMargin: 20
            minimumPixelSize: 12
        }

        Image {
            id: image_adsNews
            width: applicationWindow.width / 2 - 40
            height: image_adsNews.width
            anchors.left: parent.left
            anchors.top: text_NewOpens1.bottom
            source: "qrc:/Images/ccd08c64484027.5ad45886d3d6c.jpg"
            anchors.topMargin: 20
            anchors.leftMargin: 20
            fillMode: Image.Stretch
            MouseArea
            {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                hoverEnabled: true
                onClicked:
                {
                    console.log("mouseArea image_adsNews wwas clicked")
                }
            }
            Text {
                id: text_adsImage
                text: qsTr("???????????????? ???????????????? ?? ????????????????")
                anchors.left: parent.left
                anchors.bottom: roundButton_buy1.top
                font.pixelSize: 16
                anchors.leftMargin: 25
                anchors.bottomMargin: 25
            }

            Material_Button {
                id: roundButton_buy1
                y: 656
                text: "????????????"
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                rightPadding: 20
                leftPadding: 20
                font.capitalization: Font.MixedCase
                anchors.leftMargin: 25
                anchors.bottomMargin: 25
                myRadius:20
                cursorType: Qt.PointingHandCursor
                myHighlightedRippleColor: "#cec7c6"
                myButtonColor: "#ffffff"
            }
        }

        Image {
            id: image_adsNews_ForKids
            x: 820
            y: 20
            width: applicationWindow.width / 2 - 40
            height: image_adsNews1.width
            anchors.right: parent.right
            anchors.top: text_NewOpens1.bottom
            source: "qrc:/Images/asia_NikeKids.webp"
            anchors.topMargin: 20
            anchors.rightMargin: 20
            fillMode: Image.PreserveAspectFit
            MouseArea
            {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                hoverEnabled: true
                onClicked:
                {
                    console.log("mouseArea image_adsNews wwas clicked")
                }
            }

            Text {
                id: text_adsImage1
                text: qsTr("?????????? ??????????????????")
                anchors.left: parent.left
                anchors.bottom: roundButton_buy2.top
                font.pixelSize: 16
                anchors.leftMargin: 25
                anchors.bottomMargin: 25
            }

            Material_Button {
                id: roundButton_buy2
                y: 656
                text: "?????? ??????????"
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                font.capitalization: Font.MixedCase
                rightPadding: 20
                leftPadding: 20
                anchors.leftMargin: 25
                anchors.bottomMargin: 25
                myRadius:20
                cursorType: Qt.PointingHandCursor
                myHighlightedRippleColor: "#cec7c6"
                myButtonColor: "#ffffff"

            }
        }


        Text {
            id: text_nowInTrend
            text: qsTr("???????????? ?? ????????????")
            anchors.left: parent.left
            anchors.top: image_adsNews.bottom
            font.pixelSize: 24
            anchors.leftMargin: 20
            anchors.topMargin: 20
        }

        ListView {
            id: listView_nowInTrend
            x: 20
            height: width/3 +75
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: text_nowInTrend.bottom
            anchors.topMargin: 20
            delegate: Item {
                width: listView_nowInTrend.width / 3
                height: listView_nowInTrend.width / 3
                MouseArea
                {
                    cursorShape: Qt.PointingHandCursor
                    anchors.fill: parent
                    onClicked:
                    {
                        console.log(productName)
                    }
                }
                ColumnLayout {
                    id: columnLayout1
                    anchors.fill: parent
                    Image {
                        id: image1
                        source: imageURL
                        Layout.minimumHeight: 128
                        Layout.preferredHeight: parent.height
                        Layout.minimumWidth: 128
                        Layout.preferredWidth: parent.width
                        fillMode: Image.Stretch
                    }

                    Text {
                        id: text5
                        text: productName
                        font.pixelSize: 16
                        Layout.fillWidth: true
                        Text {
                            id: text4
                            text: price
                            anchors.right: parent.right
                            font.pixelSize: 16
                            anchors.rightMargin: 0
                        }
                    }

                    Text {
                        id: text6
                        color: "#757575"
                        text: decription
                        font.pixelSize: 16
                    }
                }
            }
            contentWidth:listView_nowInTrend.width / 3
            anchors.leftMargin: 20
            spacing: 10
            flickableDirection: Flickable.HorizontalFlick
            contentHeight: listView_nowInTrend.height
            anchors.rightMargin: 20
            model: ListModel {
                ListElement {
                    price: "15 499 ???"
                    imageURL: "Images/trend1.webp"
                    decription: "?????????????? ??????????"
                    productName: "Nike Air Max Plus"
                }

                ListElement {
                    price: "10 299 ???"
                    imageURL: "Images/trend2.webp"
                    decription: "?????????????? ???????? Nike"
                    productName: "LeBron x Space Jam: A New Legacy"
                }

                ListElement {
                    price: "8 299 ???"
                    imageURL: "Images/trend3.webp"
                    decription: "?????????????? ????????????????"
                    productName: "Nike Sportswear Tech Fleece"
                }

                ListElement {
                    price: "11 299 ???"
                    imageURL: "Images/trend4.webp"
                    decription: "?????????????? ?????????? ?????? ??????????????????????????"
                    productName: "Nike Pegasus Trail 3"
                }

                ListElement {
                    price: "13 499 ???"
                    imageURL: "Images/trend5.webp"
                    decription: "?????????????? ??????????"
                    productName: "Nike Air Max 90 SE"
                }
                ListElement {
                    price: "5 999 ???"
                    imageURL: "Images/trend6.webp"
                    decription: "?????????????? ?????????????? ??????????"
                    productName: "Nike AeroSwift"
                }
                ListElement {
                    price: "16 299 ???"
                    imageURL: "Images/trend7.webp"
                    decription: "?????????????? ??????????"
                    productName: "Nike Air Max Plus 3 Leather"
                }
                ListElement {
                    price: "12 299 ???"
                    imageURL: "Images/trend8.webp"
                    decription: "?????????? ?????? ????????????????????"
                    productName: "Nike Air Max Plus"
                }
            }
            boundsBehavior: Flickable.StopAtBounds
            orientation: ListView.Horizontal
            ScrollBar.horizontal: ScrollBar {
            }
        }

        Text {
            id: text_doNotSkip
            x: 56
            text: qsTr("???? ????????????????")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: listView_nowInTrend.bottom
            font.pixelSize: 24
            anchors.topMargin: 20
            anchors.rightMargin: 20
            anchors.leftMargin: 20
        }

        Image {
            id: image_numberOne
            x: 20
            height: applicationWindow.width / 2 + 75
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: text_doNotSkip.bottom
            source: "qrc:/Images/imageForYou.webp"
            anchors.topMargin: 20
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            fillMode: Image.Stretch
            MouseArea
            {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                hoverEnabled: true
                onClicked:
                {
                    console.log("mouseArea image_numberOne wwas clicked")  //use for click insted usuale onCliked from button
                }
            }

            Text {
                id: text_collection
                y: 496
                color: "#ffffff"
                text: qsTr("?????????????????? Nike One ?????????????? ?????? ?????????????? ???????????????? ?? ?????????? ????????????????.")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.bottom: roundButton_buy.top
                font.pixelSize: 16
                wrapMode: Text.WordWrap
                anchors.bottomMargin: 20
                anchors.rightMargin: 20
                anchors.leftMargin: 20
            }

            Text {
                id: text8
                y: 429
                color: "#ffffff"
                text: qsTr("?????????? ???????? ?????? ????????")
                anchors.left: parent.left
                anchors.bottom: text_collection.top
                font.pixelSize: 48
                anchors.bottomMargin: 20
                anchors.leftMargin: 20
                font.bold: true
            }

            Material_Button {
                id: roundButton_buy
                y: 528
                text: "????????????"
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                rightPadding: 20
                leftPadding: 20
                font.capitalization: Font.MixedCase
                anchors.leftMargin: 20
                anchors.bottomMargin: 20
                myRadius:20
                cursorType: Qt.PointingHandCursor
                myHighlightedRippleColor: "#cec7c6"
                myButtonColor: "#ffffff"

            }

            Material_Button {
                id: roundButton_forKids
                y: 528
                text: "?????? ??????????"
                anchors.left: roundButton_buy.right
                anchors.bottom: parent.bottom
                rightPadding: 20
                leftPadding: 20
                font.capitalization: Font.MixedCase
                anchors.bottomMargin: 20
                anchors.leftMargin: 20
                myRadius:20
                cursorType: Qt.PointingHandCursor
                myHighlightedRippleColor: "#cec7c6"
                myButtonColor: "#ffffff"
            }
        }

        Text {
            id: text_moreFromNike
            text: qsTr("???????????? ???? Nike")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: image_numberOne.bottom
            font.pixelSize: 24
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            anchors.topMargin: 20
        }


        Image {
            id: image_moreFromNike
            x: 20
            y: 4839
            height: applicationWindow.width / 7
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: text_moreFromNike.bottom
            source: "qrc:/Images/nikeClub.webp"
            anchors.topMargin: 20
            anchors.rightMargin: 20
            anchors.leftMargin: 20
            fillMode: Image.Stretch
            MouseArea
            {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                hoverEnabled: true
                onClicked:
                {
                    console.log("mouseArea image_moreFromNike wwas clicked")  //use for click insted usuale onCliked from button
                }
            }

            Text {
                id: text_theNikeClub
                y: 59
                text: qsTr("?????? Nike ????????")
                anchors.left: parent.left
                anchors.bottom: text_playNow.top
                font.pixelSize: 48
                anchors.bottomMargin: 5
                anchors.leftMargin: 20
                font.capitalization: Font.AllUppercase
                font.bold: true
            }

            Text {
                id: text_playNow
                y: 114
                text: qsTr("Play new. Play now")
                anchors.left: parent.left
                anchors.bottom: roundButton_WithUs.top
                font.pixelSize: 16
                anchors.bottomMargin: 5
                anchors.leftMargin: 20
                minimumPixelSize: 11
            }

            Material_Button {
                id: roundButton_WithUs
                y: 164
                text: "?????????? ?? ????????"
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                bottomPadding: 12
                topPadding: 12
                padding: 20
                font.capitalization: Font.MixedCase
                anchors.bottomMargin: 10
                anchors.leftMargin: 15
                myRadius:20
                cursorType: Qt.PointingHandCursor
                Material.theme: Material.Dark
                myHighlightedRippleColor: "#cec7c6"
                myHighlightedButtonColor:"#cec7c6"
                myButtonColor:"#111111"
                myForeground: "#ffffff"
            }
        }

        Text {
            id: text_moreFromNike1
            x: 20
            text: qsTr("???????????? ???? Nike")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: image_moreFromNike.bottom
            font.pixelSize: 24
            anchors.rightMargin: 20
            anchors.topMargin: 20
            anchors.leftMargin: 20
        }

        RowLayout {
            id: rowLayout
            x: 20
            width: 100
            height: applicationWindow.width / 2.7
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: text_moreFromNike1.bottom
            spacing: 20
            anchors.topMargin: 20
            anchors.rightMargin: 20
            anchors.leftMargin: 20

            Image {
                id: image_man
                source: "qrc:/Images/man.webp"
                Layout.fillHeight: true
                Layout.fillWidth: true

                fillMode: Image.Stretch
                MouseArea
                {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                    onClicked:
                    {
                        console.log("mouseArea image_man wwas clicked")  //use for click insted usuale onCliked from button
                    }
                }

                Material_Button {
                    id: roundButton_man
                    y: 243
                    text: "??????????????"
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    myButtonColor: "#ffffff"
                    myHighlightedRippleColor: "#cec7c6"
                    rightPadding: 20
                    leftPadding: 20
                    font.capitalization: Font.MixedCase
                    anchors.bottomMargin: 20
                    anchors.leftMargin: 20
                    myRadius:20
                    cursorType: Qt.PointingHandCursor

                }
            }

            Image {
                id: image_woman

                source: "qrc:/Images/woman.webp"
                Layout.fillHeight: true
                Layout.fillWidth: true

                fillMode: Image.Stretch
                MouseArea
                {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                    onClicked:
                    {
                        console.log("mouseArea image_woman wwas clicked")  //use for click insted usuale onCliked from button
                    }
                }

                Material_Button {
                    id: roundButton_man1
                    y: 243
                    text: "??????????????"
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    rightPadding: 20
                    leftPadding: 20
                    myHighlightedRippleColor: "#cec7c6"
                    myButtonColor: "#ffffff"
                    font.capitalization: Font.MixedCase
                    anchors.bottomMargin: 20
                    anchors.leftMargin: 20
                    myRadius:20
                    cursorType: Qt.PointingHandCursor

                }
            }

            Image {
                id: image_kids
                visible: true
                source: "qrc:/Images/Kids.webp"
                Layout.fillHeight: true
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                fillMode: Image.Stretch
                MouseArea
                {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                    onClicked:
                    {
                        console.log("mouseArea image_kids wwas clicked")  //use for click insted usuale onCliked from button
                    }
                }

                Material_Button {
                    id: roundButton_man2
                    y: 243
                    text: "????????"
                    anchors.left: parent.left
                    anchors.bottom: parent.bottom
                    myButtonColor: "#ffffff"
                    myHighlightedRippleColor: "#cec7c6"
                    rightPadding: 20
                    leftPadding: 20
                    font.capitalization: Font.MixedCase
                    anchors.bottomMargin: 20
                    anchors.leftMargin: 20
                    myRadius:20
                    cursorType: Qt.PointingHandCursor

                }
            }
        }
        Rectangle
        {

            id: rectangle_category
            height: 190
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rowLayout.bottom
            anchors.leftMargin: 20
            anchors.rightMargin: 20
            anchors.topMargin: 20
            clip: true

            MouseArea
            {
                anchors.fill: parent
                hoverEnabled: true
                onEntered:
                {
                    console.log("entered")
                    animationCategoryOpen.start()
                }
                onExited:
                {
                    console.log("exit")
                    animationCategoryClose.start()
                }

                GridLayout {
                    id: gridLayout_category
                    x: 0
                    y: 0
                    height: 400
                    anchors.left: parent.left
                    anchors.right: parent.right
                    columns: 4
                    rows: 12
                    anchors.topMargin: 20
                    clip: true

                    Text {
                        id: text7
                        text: qsTr("??????????")
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        Layout.fillHeight: false
                        Layout.fillWidth: false
                    }

                    Text {
                        id: text9
                        text: qsTr("????????????")
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    }

                    Text {
                        id: text10
                        text: qsTr("?????? ??????????")
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    }

                    Text {
                        id: text11
                        text: "??????????????????????????????"
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    }

                    Text_material {
                        id: text12
                        color: "#757575"
                        text: qsTr("?????????????????? ?? ???????????? ??????????")
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignTop
                        wrapMode: Text.NoWrap
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text13
                        color: "#757575"
                        text: qsTr("?????? ????????????")
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text14
                        color: "#757575"
                        text: qsTr("?????????????? ??????????????????")
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text15
                        color: "#757575"
                        text: qsTr("??????????????")
                        font.pixelSize: 16
                        styleColor: "#000000"
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text16
                        color: "#757575"
                        text: qsTr("???????????????????? ??????????")
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignTop
                        wrapMode: Text.NoWrap
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text17
                        color: "#757575"
                        text: qsTr("???????????? ??????????")
                        font.pixelSize: 16
                        Layout.fillHeight: false
                        Layout.fillWidth: false
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text18
                        color: "#757575"
                        text: qsTr("?????????????? ??????????????")
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text19
                        color: "#757575"
                        text: qsTr("?????????????? ?? ??????????")
                        font.pixelSize: 16
                        styleColor: "#000000"
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text20
                        color: "#757575"
                        text: qsTr("?????????????? ??????????")
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignTop
                        wrapMode: Text.NoWrap
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text21
                        color: "#757575"
                        text: qsTr("?????????? ?? ????????????????")
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text22
                        color: "#757575"
                        text: qsTr("?????????????? ???????????????????? ??????????")
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text23
                        color: "#757575"
                        text: qsTr("???????????????????? ????????")
                        font.pixelSize: 16
                        styleColor: "#000000"
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text24
                        color: "#757575"
                        text: qsTr("?????????? ?????? ??????????????")
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignTop
                        wrapMode: Text.NoWrap
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text25
                        color: "#757575"
                        text: qsTr("???????????????????? ??????????????")
                        font.pixelSize: 16
                        Layout.fillHeight: false
                        Layout.fillWidth: false
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text26
                        color: "#757575"
                        text: qsTr("?????????????? ?????????????? ??????????????????")
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text27
                        color: "#757575"
                        text: qsTr("???????????????????? ????????????????")
                        font.pixelSize: 16
                        styleColor: "#000000"
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text28
                        color: "#757575"
                        text: qsTr("?????????? ?????? ????????????")
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignTop
                        wrapMode: Text.NoWrap
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text29
                        color: "#757575"
                        text: qsTr("????????")
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text30
                        color: "#757575"
                        text: qsTr("Jordan ?????? ??????????")
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text31
                        color: "#757575"
                        text: qsTr("???????????? ??????????????????")
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        styleColor: "#000000"
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text32
                        color: "#757575"
                        text: qsTr("?????????? ?????? ??????????????????????????")
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignTop
                        wrapMode: Text.NoWrap
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text33
                        color: "#757575"
                        text: qsTr("????????????")
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        Layout.fillHeight: false
                        Layout.fillWidth: false
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text34
                        color: "#757575"
                        text: qsTr("?????????????? ????????")
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text35
                        color: "#757575"
                        text: qsTr("???????????? ???????????????????? ??????????")
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        styleColor: "#000000"
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text36
                        color: "#757575"
                        text: qsTr("?????????????????????????? ??????????")
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignTop
                        wrapMode: Text.NoWrap
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text37
                        color: "#757575"
                        text: qsTr("?????????? ?? ????????????")
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text38
                        color: "#757575"
                        text: qsTr("?????????????? ????????????????")
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text39
                        color: "#757575"
                        text: qsTr("?????????????? ??????????????")
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                        styleColor: "#000000"
                    }

                    Text_material {
                        id: text40
                        color: "#757575"
                        text: qsTr("?????????????????? ?????????? ")
                        font.pixelSize: 16
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignTop
                        wrapMode: Text.NoWrap
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text41
                        color: "#757575"
                        text: qsTr("?????????? ?????? ????????")
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works

                    }

                    Text_material {
                        id: text42
                        color: "#757575"
                        text: qsTr("?????????????? ???????????????????? ??????????????")
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                    Text_material {
                        id: text43
                        color: "#757575"
                        text: qsTr("?????????????? Factory Store")
                        font.pixelSize: 16
                        Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                        styleColor: "#000000"
                        hoverColor:"#000000" //all okay qt can write error but it works
                    }

                }
            }
            // IMHO but without this animation was better (footer and list of product)
            NumberAnimation {
                id: animationCategoryOpen
                target: rectangle_category
                properties: "height"
                running: false
                to: 420
            }

            NumberAnimation {
                id: animationCategoryClose
                target: rectangle_category
                properties: "height"
                running: false
                to: 190
            }

        }



        Rectangle {
            id: rectangle_Footer
            x: 0
            height: 273
            color: "#000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangle_category.bottom
            anchors.topMargin: 0
            anchors.leftMargin: 0
            anchors.rightMargin: 0

            GridLayout {
                id: gridLayout
                x: 20
                y: 8
                width: 675
                height: 178
                columns: 3

                Text_material {
                    id: text_findShop
                    color: "#ffffff"
                    text: qsTr("?????????? ??????????????")
                    font.pixelSize: 14
                    font.capitalization: Font.AllUppercase
                }

                Text_material {
                    id: text_help
                    color: "#ffffff"
                    text: qsTr("????????????")
                    font.pixelSize: 14
                    font.capitalization: Font.AllUppercase
                }

                Text_material {
                    id: text_about
                    color: "#ffffff"
                    text: qsTr("?? Nike")
                    font.pixelSize: 14
                    font.capitalization: Font.AllUppercase
                }

                Text_material {
                    id: text_subscribeNews
                    color: "#ffffff"
                    text: qsTr("?????????????????????? ???? ????????????????")
                    font.pixelSize: 14
                    font.capitalization: Font.AllUppercase
                }

                Text_material {
                    id: text_status
                    color: "#7e7e7e"
                    text: qsTr("???????????? ????????????")
                    font.pixelSize: 12
                    font.capitalization: Font.MixedCase
                    hoverColor:"#ffffff"
                }

                Text_material {
                    id: text_findShop5
                    color: "#7e7e7e"
                    text: qsTr("??????????????")
                    font.pixelSize: 12
                    font.capitalization: Font.MixedCase
                    hoverColor:"#ffffff"
                }

                Text_material {
                    id: text_membership
                    color: "#ffffff"
                    text: qsTr("?????????? ???????????? ??????????")
                    font.pixelSize: 14
                    font.capitalization: Font.AllUppercase
                }

                Text_material {
                    id: text_delivery
                    color: "#7e7e7e"
                    text: qsTr("????????????????")
                    font.pixelSize: 12
                    font.capitalization: Font.MixedCase
                    hoverColor:"#ffffff"
                }

                Text_material {
                    id: text_Career
                    color: "#7e7e7e"
                    text: qsTr("??????????????")
                    font.pixelSize: 12
                    font.capitalization: Font.MixedCase
                    hoverColor:"#ffffff"
                }

                Text_material {
                    id: text_feedBack
                    color: "#ffffff"
                    text: qsTr("???????????????? ??????????")
                    font.pixelSize: 14
                    font.capitalization: Font.AllUppercase
                }

                Text_material {
                    id: text_returnProduvt
                    color: "#7e7e7e"
                    text: qsTr("??????????????")
                    font.pixelSize: 12
                    font.capitalization: Font.MixedCase
                    hoverColor:"#ffffff"
                }

                Text_material {
                    id: text_useLess
                    color: "#7e7e7e"
                    text: qsTr("????????????????????")
                    font.pixelSize: 12
                    font.capitalization: Font.MixedCase
                    hoverColor:"#ffffff"
                }

                Text_material {
                    id: text_useLess1
                    opacity: 0
                    color: "#7e7e7e"
                    text: qsTr("????????????????????")
                    font.pixelSize: 12
                    font.capitalization: Font.MixedCase
                    hoverColor:"#ffffff"
                }

                Text_material {
                    id: text_payWay
                    color: "#7e7e7e"
                    text: qsTr("?????????????? ????????????")
                    font.pixelSize: 12
                    font.capitalization: Font.MixedCase
                    hoverColor:"#ffffff"
                }

                Text_material {
                    id: text_natureCare
                    color: "#7e7e7e"
                    text: qsTr("???????????? ???? ???????????????????? ??????????")
                    font.pixelSize: 12
                    font.capitalization: Font.MixedCase
                    hoverColor:"#ffffff"
                }

                Text_material {
                    id: text_investor
                    opacity: 0
                    color: "#7e7e7e"
                    text: qsTr("????????????????????")
                    font.pixelSize: 12
                    font.capitalization: Font.MixedCase
                    hoverColor:"#ffffff"
                }

                Text_material {
                    id: text_callWithUs
                    color: "#7e7e7e"
                    text: qsTr("?????????????????? ?? ????????")
                    font.pixelSize: 12
                    font.capitalization: Font.MixedCase
                    hoverColor:"#ffffff"
                }



            }

            RowLayout {
                id: rowLayout_socialMedia
                x: 1370
                width: 207
                height: 44
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.rightMargin: 20

                Material_RoundButton {
                    id: roundButton_twitter
                    icon.source: "qrc:/Images/twitter.png"
                    myButtonColor: "#7e7e7e"
                    myHover: "#ffffff"
                    cursorType: Qt.PointingHandCursor

                }

                Material_RoundButton {
                    id: roundButton_facebook
                    icon.source: "qrc:/Images/facebook.png"
                    myButtonColor: "#7e7e7e"
                    myHover: "#ffffff"
                    cursorType: Qt.PointingHandCursor
                }

                Material_RoundButton {
                    id: roundButton_youtube
                    icon.source: "qrc:/Images/youtube.png"
                    myButtonColor: "#7e7e7e"
                    myHover: "#ffffff"
                    cursorType: Qt.PointingHandCursor
                }

                Material_RoundButton {
                    id: roundButton_instagram
                    icon.source: "qrc:/Images/instagram.png"
                    myButtonColor: "#7e7e7e"
                    myHover: "#ffffff"
                    cursorType: Qt.PointingHandCursor
                }
            }

            Rectangle {
                id: rectangle_footerDivider
                y: 192
                width: 200
                height: 2
                color: "#111111"
                radius: 1
                border.color: "#111111"
                border.width: 3
                anchors.left: parent.left
                anchors.right: parent.right
                rotation: 359.788
                anchors.rightMargin: 0
                anchors.leftMargin: 0

            }

            Image {
                id: image_location
                y: 203
                width: 32
                height: 32
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                source: "Images/round_location_on_white_24dp.png"
                anchors.bottomMargin: 20
                anchors.leftMargin: 5
                fillMode: Image.PreserveAspectFit
                MouseArea
                {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true

                }
            }

            Text_material {
                id: text_location
                y: 251
                color: "#ffffff"
                text: qsTr("????????????")
                anchors.left: image_location.right
                anchors.bottom: parent.bottom
                font.pixelSize: 12
                anchors.bottomMargin: 20
                anchors.leftMargin: 5
            }

            Text {
                id: text_copyright
                y: 236
                color: "#7e7e7e"
                text: qsTr("?? Nike, Inc., 2021. ?????? ?????????? ????????????????.")
                anchors.left: text_location.right
                anchors.bottom: parent.bottom
                font.pixelSize: 12
                anchors.bottomMargin: 20
                anchors.leftMargin: 5
            }

            Text_material {
                id: text_footerCookie
                x: 1533
                y: 248
                color: "#7e7e7e"
                text: qsTr("???????????????????????????????????? ?? ?????????? cookie")
                anchors.right: parent.right
                anchors.bottom: parent.bottom
                font.pixelSize: 12
                anchors.rightMargin: 5
                anchors.bottomMargin: 20
                hoverColor:"#ffffff"  //all okay if error it is work when built
            }

            Text_material {
                id: text_footerAbout
                x: 1334
                y: 236
                color: "#7e7e7e"
                text: qsTr("?? ????????????????")
                anchors.right: text_footerCookie.left
                anchors.bottom: parent.bottom
                font.pixelSize: 12
                anchors.bottomMargin: 20
                anchors.rightMargin: 10
                hoverColor:"#ffffff"  //all okay if error it is work when built
            }

            Text_material {
                id: text_footersellCondition
                x: 1214
                y: 236
                color: "#7e7e7e"
                text: qsTr("?????????????? ??????????????")
                anchors.right: text_footerAbout.left
                anchors.bottom: parent.bottom
                font.pixelSize: 12
                anchors.rightMargin: 10
                anchors.bottomMargin: 20
                hoverColor:"#ffffff"  //all okay if error it is work when built
            }

            Text_material {
                id: text_footerUseTerms
                x: 1115
                y: 236
                color: "#7e7e7e"
                text: qsTr("?????????????? ??????????????????????????")
                anchors.right: text_footersellCondition.left
                anchors.bottom: parent.bottom
                font.pixelSize: 12
                anchors.bottomMargin: 20
                anchors.rightMargin: 10
                hoverColor:"#ffffff"  //all okay if error it is work when built
            }

            Text_material {
                id: text_footerCatalog
                x: 968
                y: 236
                color: "#7e7e7e"
                text: qsTr("??????????????")
                anchors.right: text_footerUseTerms.left
                anchors.bottom: parent.bottom
                font.pixelSize: 12
                anchors.rightMargin: 10
                anchors.bottomMargin: 20
                hoverColor:"#ffffff"     //all okay if error it is work when built

            }

        }
        Rectangle {
            id: rectangle_grayScreen
            color: "#4d000000"
            anchors.fill: parent
            visible: false
            MouseArea
            {
                id:mouseArea_ExiteFromBigSearch
                anchors.fill: parent
                onClicked:
                {

                    listView_SearchResult.visible =false
                    text_material_PopularRequest.visible = false
                    animationSearchClose.start()
                    searchBox.searchInputTextBox.focus = false
                }
            }
        }

        Rectangle {
            id: rectangle_BigSearch
            y: 0
            width: 0
            height: 288
            color: "#ffffff"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.rightMargin: 100
            anchors.leftMargin: applicationWindow.width - rectangle_BigSearch.anchors.rightMargin
            visible: false

            SearchBox {
                id: searchBox_BigSearch
                height: 40
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.topMargin: 10
                anchors.leftMargin: 60
                anchors.rightMargin: 64
                anchors.bottomMargin: 240

            }

            Material_RoundButton {
                id: roundButton_closeBigSearch
                x: 1334
                icon.source: "qrc:/Images/baseline_close_black_24dp.png"
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 5
                anchors.rightMargin: 10
                cursorType: Qt.PointingHandCursor
                onClicked:
                {

                    listView_SearchResult.visible =false
                    text_material_PopularRequest.visible = false
                    animationSearchClose.start()
                    searchBox.searchInputTextBox.focus = false
                }
            }

            Text {
                id: text_material_PopularRequest
                color: "#757575"
                text: "???????????????????? ?????????????????? ??????????????"
                anchors.left: parent.left
                anchors.top: searchBox_BigSearch.bottom
                anchors.leftMargin: 163
                anchors.topMargin: 20
                font.pointSize: 12
                visible: false
            }

            ListView {
                id: listView_SearchResult
                width: 1088
                anchors.left: parent.left
                anchors.top: text_material_PopularRequest.bottom
                anchors.bottom: parent.bottom
                anchors.leftMargin: 165
                anchors.topMargin: 6
                anchors.bottomMargin: 8
                visible: false
                model: ListModel {
                    ListElement {
                        resultName: "Air Force1"
                    }

                    ListElement {
                        resultName: "Jordan"
                    }

                    ListElement {
                        resultName: "Air Max"
                    }

                    ListElement {
                        resultName: "Blazer"
                    }
                }
                delegate:
                    Text_material {

                        id: result
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.leftMargin:0
                        anchors.rightMargin: 0
                         color: "#1c1b1b"
                        text: qsTr(resultName)
                        font.pointSize: 16
                        hoverColor:"#574e52"
                }

            }
        }


    }



}







/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}D{i:165}
}
##^##*/
