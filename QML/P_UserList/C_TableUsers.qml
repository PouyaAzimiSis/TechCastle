import QtQuick 2.12
import QtQuick.Controls 2.12
import "../"
Item {
    id:root

    Connections{
        target: StateManager
        onUserListUpdated:{

//            console.log("Data for table:"+listOfusers.data.items);
            console.log("Data for table:"+listOfusers);
            id_model.clear();
            for(let i=0;i<listOfusers.length;i++){
                id_model.append({"info":listOfusers[i]})
            }
            console.log("data in model:"+id_model.count)

        }
    }

    ListModel{
        id:id_model
    }


    ListView {
        anchors.fill: parent
        model: id_model
        spacing: 5
        clip: true
        delegate:C_TableDelegate{
            userData: info
            height: 40
            width: root.width
            indexOfDelegate: index
        }


    }

}
