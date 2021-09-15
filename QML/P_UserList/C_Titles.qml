import QtQuick 2.12
import QtQuick.Layouts 1.12

RowLayout {

    Item {
        Layout.preferredWidth: 60
    }


    C_Title{
        Layout.preferredWidth: 60
        text: "ID"
    }
    C_Title{
        Layout.minimumWidth: 90
        Layout.preferredWidth: 110
        text: "Name"
        Layout.fillWidth: true
    }
    C_Title{
        Layout.minimumWidth: 90
        Layout.preferredWidth: 110
        text: "Nick Name"
        Layout.fillWidth: true
    }
    C_Title{
        Layout.minimumWidth: 150
        Layout.preferredWidth: 230
        text: "Email"
        Layout.fillWidth: true
    }
    C_Title{

        Layout.minimumWidth: 80
        Layout.maximumWidth: 110
        text: "Status"
        Layout.fillWidth: true
    }
    C_Title{
        Layout.minimumWidth: 80
        Layout.maximumWidth: 110
        text: "Min bet"
        Layout.fillWidth: true
    }
    C_Title{
        Layout.minimumWidth: 80
        Layout.maximumWidth: 110
        text: "Max bet"
        Layout.fillWidth: true
    }
    C_Title{
        Layout.minimumWidth: 80
        Layout.maximumWidth: 100
        text: "Level"
        Layout.fillWidth: true
    }
    C_Title{
        Layout.minimumWidth: 100
        Layout.maximumWidth: 120
        text: "Verification"
        Layout.fillWidth: true
    }
    C_Title{
        Layout.minimumWidth: 100
        Layout.maximumWidth: 120
        text: "Language ID"
        Layout.fillWidth: true
    }



}
