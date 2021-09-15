pragma Singleton
import QtQuick 2.12


QtObject{

    function sendLoginReqest(username,passowrd, callback) {

        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if(xmlhttp.readyState === XMLHttpRequest.DONE){
                callback(xmlhttp)
            }
        }

        xmlhttp.open("POST",Config.serverAdress+ "/api/v1/login");
        xmlhttp.setRequestHeader("Accept", "application/json");
        xmlhttp.setRequestHeader("Content-Type", "application/json");

//        const json = {
//            "email" : "pooyasis@gmail.com", //username,
//            "password" :"xKm8UM0n-Ypy-UA" //passowrd
//        }
        const json = {
            "email" :  username,
            "password":  passowrd
        }

        xmlhttp.send(JSON.stringify(json));
    }

    //=========================================================================
    function sendUsersListRequest(token,callback){
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if(xmlhttp.readyState === XMLHttpRequest.DONE){
                callback(xmlhttp)
            }
        }

        xmlhttp.open("GET",Config.serverAdress+ "/api/v1/users");
        xmlhttp.setRequestHeader("Accept", "application/json");
        xmlhttp.setRequestHeader("Content-Type", "application/json");
        xmlhttp.setRequestHeader("Authorization", "Bearer "+ token);

        xmlhttp.send();
    }
    //=========================================================================
    function sendLogOutRequest(token,callback){
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if(xmlhttp.readyState === XMLHttpRequest.DONE){
                callback(xmlhttp)
            }
        }

        xmlhttp.open("POST",Config.serverAdress+ "/api/v1/logout");
        xmlhttp.setRequestHeader("Accept", "application/json");
        xmlhttp.setRequestHeader("Content-Type", "application/json");
        xmlhttp.setRequestHeader("Authorization", "Bearer "+ token);

        xmlhttp.send();
    }
    //=========================================================================
    function sendEditUserRequest(userInfo,token,callback){
        console.log(token)
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function() {
            if(xmlhttp.readyState === XMLHttpRequest.DONE){
                callback(xmlhttp)
            }
        }

        xmlhttp.open("PUT",Config.serverAdress+ "/api/v1/users/update/"+userInfo.id);
        xmlhttp.setRequestHeader("Accept", "application/json");
        xmlhttp.setRequestHeader("Content-Type", "application/json");
        xmlhttp.setRequestHeader("Authorization", "Bearer "+ token);

        const json = {
            "name" : userInfo.name,
            "nickname": userInfo.nickname,
            "language_id": userInfo.language_id,
            "status": userInfo.status,
            "min_bet": userInfo.min_bet,
            "max_bet": userInfo.max_bet,
            "user_level": userInfo.user_level,
        }


        //apped password if is not empty and are same
        console.log("password"+userInfo.password+userInfo.password_confirmation)
        if(userInfo.password.length >0 &&
                userInfo.password_confirmation.length > 0){
            json.password = userInfo.password;
            json.password_confirmation = userInfo.password_confirmation
        }

        console.log(JSON.stringify(json))
        xmlhttp.send(JSON.stringify(json));
    }
}


