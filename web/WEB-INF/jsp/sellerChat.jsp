<%--
  Created by IntelliJ IDEA.
  User: liutao
  Date: 2015/9/16
  Time: 21:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title></title>
    <style>
        body {
            font-family: 微软雅黑;
            font-size: 16px;
        }

        .inf {

            width: 20%;
            border-bottom: 1px solid #939393;
            padding: 5px;
            border-radius: 4px;

        }

        .inf:hover {
            border: 1px solid #939393;
        }


        #chat {
            position: absolute;
            left: 560px;
            top: 100px;
            border: 1px solid #c0c4c3;
            border-radius: 5px;
            display: none;
        }

        #chat input {
            background: transparent;
            font-family: 微软雅黑;
            border-radius: 2px;
            height: 24px;
            width: 350px;
            margin-left: 10px;
            border: 1px solid #bcc0c2;
        }
#chat button{
    font-family: 微软雅黑;
    background: transparent;
    border-radius: 2px;
    border: 1px solid #bcc0c2;
}
        #chat img {
            position: inherit;
            right: 0px;
            top: 0px;
            width: 30px;
            height: 30px;
        }

        #chatK {
            width: 500px;
            height: 400px;
            overflow-y: scroll;
        }


        #chatK div{
            padding-bottom:13px;
        }
        #chatK div span{
            width: auto;
            height: auto;
            border: 1px solid rgba(0, 0, 0, 0.49);
            border-top: none;
            background:transparent;
            border-radius:3px;
            color: #000000;
        }

    </style>
</head>

<body>
<c:forEach items="${objects}" var="obj">
    <div id="${obj[1]}" onclick="chatting(this)" class="inf">
            ${obj[0]}
    </div>
    <br>

</c:forEach>
<div id="chat">
    <img src="/image/close.png" onclick="closed(this)"><br>

    <div id="chatK">

    </div>
    <br>
    <input type="text" id="sendText"/>
    <button onclick="sending()">发送</button>
</div>

</div>
<script>

    var chat = document.getElementById("chat");
    var chatK = document.getElementById("chatK");
    var sendText = document.getElementById("sendText");
    var tempId;
    var flag = false;
    var intervalFlag;
    function chatting(id) {
        if (!flag) {
            tempId = id.id;
            chat.style.display = "block";
            flag = true;
            intervalFlag = setInterval(catchC, 2000);
        }
    }
    function closed(id) {
        document.getElementById("chatK").innerHTML = "";
        id.parentNode.style.display = "none";
        clearInterval(intervalFlag);
        flag = false;
    }
    function catchC() {
        var xmlhttp;
        if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        }
        else {// code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var back = xmlhttp.responseText;
                if (back != "0") {
                    var str = back.split("-");
                    for (var i = 0; i < str.length - 1; i++) {
                        var newDiv = document.createElement("div");

                       //newDiv.innerHTML = "他:<br>" + str[i];
                        var newImg=document.createElement("img");
                        newImg.src="/image/mzl.png";
                        newImg.style.float="left";
                        newDiv.appendChild(newImg);
                        var little=document.createElement("span");
                        little.innerHTML=str[i];
                        newDiv.appendChild(little);
                        chatK.appendChild(newDiv);
                    }
                }

            }
        };
        var str = "id=" + tempId;
        xmlhttp.open("POST", "/selRece?rad=" + Math.random(), true);
        xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xmlhttp.send(str);
    }
    function sending() {
        var xmlhttp;
        if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        }
        else {// code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        var newDiv = document.createElement("div");
        newDiv.align = "right";
      //  newDiv.innerHTML = "我:<br>" + sendText.value;
        var lit=document.createElement("span");
        lit.innerHTML=sendText.value;
        var newImg=document.createElement("img");
        newImg.src="/image/mzl2.png";

        newImg.style.float="right";
        newDiv.appendChild(newImg);
        newDiv.appendChild(lit);
        chatK.appendChild(newDiv);
        var str = "id=" + tempId + "&content=" + sendText.value;
        xmlhttp.open("POST", "/selSend", true);
        xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xmlhttp.send(str);
    }
</script>
</body>
</html>
