pragma Singleton
import QtQuick 2.12

Item {
    id:root

    signal loginResponse(var isConfirmed);
    signal userListUpdated(var listOfusers);
    signal userLogedOut();
    signal openUserEditWindow(var userInfo);


    property var lastToken
    property string lastEmail
    onLastEmailChanged: {
        console.log("email changed"+ lastEmail)
    }

    property var listOfUsers

    //==============================================================================
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
                                         return;
                                     }
                                 }
                                 loginResponse(false);
                             })
    }
    //==============================================================================
    signal requestUsersList();
    onRequestUsersList: {
        Util.sendUsersListRequest(root.lastToken,(res)=>{
                                      let jsonRes = JSON.parse(res.responseText);
                                      root.listOfUsers = jsonRes.data.items;
                                      root.userListUpdated(root.listOfUsers);
                                  }
                                  );
    }
    //==============================================================================
    signal requestLogOut();
    onRequestLogOut: {
        Util.sendLogOutRequest(root.lastToken,(res)=>{
                                   root.lastToken = ""
                                   userLogedOut()
                               }
                               );
    }
    //==============================================================================
    signal requestEditUser(var userInfo);
    onRequestEditUser:  {
        Util.sendEditUserRequest(userInfo,root.lastToken,(res)=>{
                                     console.log(res.responseText)
                                     root.requestUsersList();
                                 }
                                 );
    }


}

