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

        const json = {
            "email" : "pooyasis@gmail.com", //username,
            "password" :"xKm8UM0n-Ypy-UA" //passowrd
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


//        console.log("token is"+ token)
        xmlhttp.open("GET",Config.serverAdress+ "/api/v1/users");
        xmlhttp.setRequestHeader("Accept", "application/json");
        xmlhttp.setRequestHeader("Content-Type", "application/json");
        xmlhttp.setRequestHeader("Authorization", "Bearer "+ token);

        xmlhttp.send();
    }
}


