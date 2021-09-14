pragma Singleton
import QtQuick 2.12

Item {
    id:root

    signal loginResponse(var isConfirmed);
    signal userListUpdated(var listOfusers);

    property var lastToken
    property string lastEmail: ""
    property var listOfUsers

    signal sendLoginRequest(var username,var password);
    onSendLoginRequest:{
        root.lastEmail = username;
        Util.sendLoginReqest(username,password,(res)=> {
                                 ;
                                 let jsonRes = JSON.parse(res.responseText);
                                 if(jsonRes.data){
                                     if(jsonRes.data.token){
                                         root.lastToken = jsonRes.data.token
                                         root.requestUsersList();
                                         loginResponse(true);
//                                         console.log("Loged In with token::" + root.lastToken)
                                         return;
                                     }
                                 }
                                 loginResponse(false);
                             })
    }


    //==============================================================================
    signal requestUsersList();
    onRequestUsersList: {
        console.log("getting user list: "+ root.lastToken);
        Util.sendUsersListRequest(root.lastToken,(res)=>{
                                      let jsonRes = JSON.parse(res.responseText);
                                      listOfUsers = jsonRes.data.Items;
                                      root.userListUpdated(listOfUsers);
                                      console.log("userList resp:"+res.responseText);

                                  }
                                  );
    }




}

