<%@ page import="tian.table.User" %>
<%--
  Created by IntelliJ IDEA.
  User: liutao
  Date: 2015/9/9
  Time: 0:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<% User user = (User) session.getAttribute("user");%>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <style>
        body {
            background-image: url(/image/yinghuo.jpg);
            background-size: 100% 100%;

            font-family: 微软雅黑;

            color: rgb(255, 255, 255);
            overflow-x: hidden;

        }

        #showBig {
            width: 580px;
            height: 580px;
        }

        #close {
            width: 30px;
            height: 30px;
            position: inherit;
            right: 0px;
            top: 0px;
            display: none;
        }

        #showBigDiv {
            position: absolute;
            left: 324px;
            top: 15px;

            display: none;

        }

        #big-div {
            margin-left: 15px;
            margin-top: 10px;
            float: left;
        }

        #show {
            width: 300px;
            height: 300px;
        }

        #img1 {
            width: 300px;
            height: 300px;
        }

        #img2 {
            width: 300px;
            height: 300px;
            position: absolute;
            overflow: hidden;
            display: none;
        }

        #img_big {
            width: 900px;
            height: 900px;
            position: absolute;
        }

        #img3 {
            background-color: rgba(0, 0, 0, 0.4);
            width: 100px;
            height: 100px;
            position: absolute;
            display: none;
        }

        .ig {
            width: 43px;
            height: 43px;
        }

        .item-div1 {
            position: absolute;
            top: 14px;
            line-height: 27px;
            padding-right: 23px;
            /* float: right;*/
            right: -17px;
            width: 530px;
            height: 592px;
            overflow-y: scroll;
        }

        .item-div2 {

            width: 37%;
            height: 360px;
            margin-left: 315px;
            margin-top: 0px;
            padding-left: 4px;
            padding-top: 0px;
            line-height: 27px;
        }

        .item-div3 {

            margin-left: 15px;
            margin-top: 0px;
            width: 59.25%;
            height: 227px;
            line-height: 27px;
        }

        button {
            background-color: transparent;
            border: 1px solid #bbc0c1;
            border-radius: 2px;
            font-family: 微软雅黑;
            font-size: 15px;
            height: 23px;
            color: rgb(255, 255, 255);

        }

        button:hover {
            background-color: rgba(255, 255, 255, 0.48);
        }

        hr {
            border: 0;
            background-color: rgb(241, 241, 241);
            height: 1px;
        }

        .close {
            width: 30px;
            height: 30px;
            position: inherit;
            right: 0px;
            top: 0px;
            display: none;
        }

        #record {
            position: absolute;
            text-align: center;
            left: 430px;
            top: 50px;
            width: 450px;
            height: 430px;
            background-color: rgba(255, 255, 255, 0.9);
            display: none;
            color: black;
        }

        #record input {
            font-family: 微软雅黑;
            background-color: transparent;
            border: 1px solid #969898;
            border-radius: 2px;
            height: 24px;
            color: black;
        }

        #chat {
            position: absolute;
            left: 560px;
            top: 130px;
            padding: 5px;
            border: 1px solid #faf3ff;
            border-radius: 5px;
            background-color: rgba(247, 247, 247, 0.9);
            display: none;

        }

        #chat input {
            background-color: transparent;
            font-family: 微软雅黑;
            color: black;
            border-radius: 2px;
            border: 1px solid #949297;
            height: 24px;
            width: 340px;
            margin-left: 10px;
        }

        #chat button {
            background-color: transparent;
            border-radius: 2px;
            color: black;
        }

        #chat img {
            position: inherit;
            right: 0px;
            top: 0px;
            width: 30px;
            height: 30px;
        }

        #chatK {
            width: 450px;
            height: 380px;
            overflow-y: scroll;
            color: black;

        }
    #chatK div{
        padding-bottom:13px;
    }
        #chatK div span{
           width: auto;
            height: auto;
            border:1px solid rgba(0, 0, 0, 0.51);
            border-top: none;
           background-color:transparent;
            border-radius:3px;
            color: #000000;
        }


    </style>
    <script src="/js/jquery-1.11.3.js" type="text/javascript"></script>


</head>
<body>
<div id="big-div">
    <div id="img1">

        <img src="/upload/${item.id}1.png?rad=<%=System.currentTimeMillis()%>" id="show">
    </div>
    <div id="img2">
        <img src="/upload/${item.id}1.png?rad=<%=System.currentTimeMillis()%>" id="img_big">
    </div>
    <div id="img3"></div>


    <c:forEach begin="1" end="${item.imageNum}" step="1" var="number">

        <img src="/upload/${item.id}${number}.png?rad=<%=System.currentTimeMillis()%>"
             <c:if test="${number==1}">style="border:1px solid #767676;border-radius: 3px"</c:if>
             class="ig" onmouseover="change(this)"  onclick="displayImg(document.getElementById('show'))">

    </c:forEach>
</div>

<div class="item-div1">
    买家评论:<br><br>
    <c:forEach items="${comm}" var="c">
        <hr>
        ${c[0]}<br>
        <c:forEach begin="1" end="${c[1]}" step="1">
            <img src="/image/comstar.png?rad=<%=System.currentTimeMillis()%>"/>
        </c:forEach>
        <br>
        ${c[2]}<br>
    </c:forEach>

</div>
<br>

<div class="item-div2">
    ${item.name}<br>
    ${item.keyWord}<br>
    价格:<br>
    ¥
    <button id="priceShow">${arrayList.get(0)[1]}</button>
    <br>
    类型选择:<br>

    <div id="select">
        <c:forEach items="${arrayList}" var="array">
            <button value="${array[1]}" <c:if
                    test="${arrayList.get(0)==array}"> style="border: 2px solid rgba(46, 161, 255, 0.87);"</c:if>
                    onclick="selected(this)">${array[0]}</button>
            &nbsp;
        </c:forEach>

    </div>

    购买数量:<br>
    <button name="minus" id="minus" disabled="disabled" onclick="numChange(this)">-</button>
    <button id="num">1</button>
    <button onclick="numChange(this)">+</button>
    <br>
    <button value="${item.id}"
            <c:choose>
                <c:when test="${user!=null}">onclick="joinCert(this)"</c:when>
                <c:otherwise>onclick="login()"</c:otherwise>
            </c:choose>>加入购物车
    </button>
    &nbsp;&nbsp;
    <button
            <c:choose>
                <c:when test="${user!=null}"> onclick="document.getElementById('record').style.display='block'"</c:when>
                <c:otherwise>onclick="login()"</c:otherwise>
            </c:choose>
            >立即购买
    </button>
    &nbsp;&nbsp;
    <button <c:choose>
        <c:when test="${user!=null}"> onclick="openC()"</c:when>
        <c:otherwise>onclick="login()"</c:otherwise>
    </c:choose>>联系卖家
    </button>
    <img src="/image/chat.png?rad=<%=System.currentTimeMillis()%>" style="width: 27px;height:25px;"/>
    <button id="sendTo" style="opacity: 0">${item.userId}</button>

</div>
<div class="item-div3">


    好评度:
    ${com[1]}<br>
    销量:
    ${com[0]}<br>
    商品描述:<br>
    ${item.description}
</div>
<div id="showBigDiv" onmouseenter="document.getElementById('close').style.display='block'"
     onmouseleave="document.getElementById('close').style.display='none'">
    <img src="/image/close.png" id="close" onclick="document.getElementById('showBigDiv').style.display='none'">
    <img src="" id="showBig"/>
</div>
<div id="chat">
    <img src="/image/close.png" onclick="cloC(this)"/><br>

    <div id="chatK">

    </div>

    <input type="text" id="se"/>
    <button onclick="sendings()">发送</button>

</div>
<div id="record" onmouseenter="this.firstElementChild.style.display='block'"
     onmouseleave="this.firstElementChild.style.display=''">
    <img src="/image/close.png" class="close" onclick="document.getElementById('record').style.display=''"><br>
    <script src="/js/angular.min.js"></script>
    <form method="post" ng-app="myApp" ng-controller="validateCtrl" name="myForm" novalidate>
        <br>
        ${item.name}
        <br><br>
        <span id="record-select">${arrayList.get(0)[0]}</span><br><br>
        <span id="record-price">${arrayList.get(0)[1]}</span>*<span id="record-num">1</span><br><br>

        联系电话:<br><input type="text" id="telephone" name="telephone" ng-model="telephone" required><br><span
            style="color: red" ng-show="myForm.telephone.$error.required">不为空</span><br>
        收件地址:<br><input type="text" id="address" name="address" ng-model="address" required><br><span style="color: red"
                                                                                                      ng-show="myForm.address.$error.required">不为空</span><br>
        <input type="button" value="付款" onclick="changeState()"
               ng-disabled="myForm.address.$error.required||myForm.telephone.$error.required"/><br><br>
        <input type="button" onclick="buy()" value="确认订单"
               ng-disabled="myForm.address.$error.required||myForm.telephone.$error.required"/>
    </form>
    <script>
        var app = angular.module('myApp', []);
        app.controller('validateCtrl', function ($scope) {
            $scope.telephone = "${user.telNum}";
            $scope.address = "${user.address}";
        });
    </script>
</div>
<script>

    var select = "${arrayList.get(0)[0]}";
    var price = "${arrayList.get(0)[1]}";
    var recordState = 0;
    function changeState() {
        recordState = 1;
    }


    function sendings() {
        var xmlhttp;
        if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        }
        else {// code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }

        var chatK = document.getElementById("chatK");
        var sendText = document.getElementById("se");
        var he = document.getElementById("sendTo").innerHTML;
        var newDiv = document.createElement("div");
        newDiv.align = "right";
        // newDiv.innerHTML =sendText.value;
        var lit=document.createElement("span");
        lit.innerHTML=sendText.value;
        var newImg=document.createElement("img");
        newImg.src="/image/mzl2.png";
     //  newImg.style.position="inherit";
     //   newImg.style.top="1px";
     //  newImg.style.right="0px";
        newImg.style.float="right";
        newDiv.appendChild(newImg);
        newDiv.appendChild(lit);

        chatK.appendChild(newDiv);

        var s = "he=" + he + "&text=" + sendText.value;
        xmlhttp.open("POST", "/sendText", true);
        xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xmlhttp.send(s);
    }
    function deg() {
        var xmlhttp;
        if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        }
        else {// code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }

        var chatK = document.getElementById("chatK");

        var he = document.getElementById("sendTo").innerHTML;
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

                       // chatK.appendChild(newDiv);

                       // newDiv.align = "right";

                       // newDiv.innerHTML =str[i];
                      //  var newImg=document.createElement("img");
                       // newImg.src="/image/comstar.png";

                        chatK.appendChild(newDiv);
                    }
                }

            }
        };
        var str = "he=" + he;
        xmlhttp.open("POST", "/degFeed?rad=" + Math.random(), true);
        xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xmlhttp.send(str);
    }
    var intervalFlag;
    function openC() {

        document.getElementById("chat").style.display = "block";

        intervalFlag = setInterval(deg, 2000);
    }
    function cloC(id) {
        id.parentNode.style.display = "none";
        clearInterval(intervalFlag);
    }
    function buy() {
        var xmlhttp;
        if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp = new XMLHttpRequest();
        }
        else {// code for IE6, IE5
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }

        var number = document.getElementById("num").innerHTML;
        var tele = document.getElementById("telephone").value;
        var addr = document.getElementById("address").value;

        xmlhttp.onreadystatechange = function () {
            if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                var valid = xmlhttp.responseText;
                if (valid == "ok") {
                    alert("购买成功！");
                    document.getElementById("record").style.display = "none";
                }

            }
        };

        var str = "tele=" + tele + "&addr=" + addr + "&select=" + select + "&price=" + price + "&number=" + number + "&recordState=" + recordState + "&itemId=" +${item.id};
        xmlhttp.open("POST", "/buy", true);
        xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xmlhttp.send(str);
    }
    function joinCert(id) {
        var itemId = id.value;
        var number = document.getElementById("num").innerHTML;
        var url = "/shoppingCert";
        var postStr = "?itemId=" + itemId + "&select=" + select + "&price=" + price + "&number=" + number;
        var ajax = false;
        if (window.XMLHttpRequest) { //Mozilla 浏览器
            ajax = new XMLHttpRequest();
            if (ajax.overrideMimeType) {//设置MiME类别
                ajax.overrideMimeType("text/xml");
            }
        }
        else if (window.ActiveXObject) { // IE浏览器
            try {
                ajax = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) {
                try {
                    ajax = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e) {
                }
            }
        }
        if (!ajax) { // 异常，创建对象实例失败
            window.alert("不能创建XMLHttpRequest对象实例.");
            return false;
        }
        //通过Post方式打开连接
        ajax.open("GET", url + postStr, true);

        ajax.send();
        //获取执行状态
        ajax.onreadystatechange = function () {
            //如果执行状态成功，那么就把返回信息写到指定的层里
            if (ajax.readyState == 4 && ajax.status == 200)
                if (ajax.responseText == "ok") {
                    alert("添加成功！");
                }

        }
    }
    function numChange(id) {
        var num = document.getElementById("num");
        var valu = parseInt(num.innerHTML);
        if (id.name == "minus") {
            if (valu > 1) {
                valu--;
                num.innerHTML = valu + "";
                document.getElementById("record-num").innerHTML = valu + "";
                if (valu == 1) {
                    id.disabled = "disabled";
                }
            }
        }
        else {
            valu++;
            num.innerHTML = "" + valu;
            document.getElementById("record-num").innerHTML = valu + "";
            document.getElementById("minus").disabled = false;
        }
    }
    function selected(id) {

        document.getElementById("select").firstElementChild.style.border = "1px solid #bbc0c1";
        document.getElementById("priceShow").innerHTML = id.value;
        select = id.innerHTML;
        price = id.value;
        document.getElementById("record-select").innerHTML = select;
        document.getElementById("record-price").innerHTML = price;
    }
    function change(id) {
        document.getElementById("show").src = id.src;
        document.getElementById("img_big").src = id.src;
        var a = document.getElementById("big-div").getElementsByTagName("img");
        for (var i = 0; i < a.length; i++) {
            a[i].style.border = "none";
        }
        id.style.border = "1px solid #767676";
     //   displayImg(document.getElementById("show"));

    }
    function displayImg(id) {

        document.getElementById("showBig").src = id.src;
        document.getElementById("showBigDiv").style.display = "block";
    }
    $(function () {
        var count = 0;
        $("#img1").mousemove(function (e) {

            var img2 = $("#img2");

            var img3 = $("#img3");
            img2.show();
            img3.show();
            var xScale = $("#img_big").width() / $("#show").width();
            var yScale = $("#img_big").height() / $("#show").height();
            var img3L = e.pageX - img3.width() / 2;
            var img3R = e.pageY - img3.height() / 2;
            var minLeft = $(this).offset().left;
            var minTop = $(this).offset().top;
            if (img3L <= minLeft) {
                img3L = minLeft;
            }
            else if (img3L >= (minLeft + $(this).width() - img3.width())) {
                img3L = minLeft + $(this).width() - img3.width();
            }
            if (img3R <= minTop) {
                img3R = minTop;
            }
            else if (img3R >= (minTop + $(this).height() - img3.height())) {
                img3R = minTop + $(this).height() - img3.height();
            }
            img3.css("left", img3L).css("top", img3R);
            img2.css("left", img3L + img3.width()).css("top", img3R + img3.height());
            img3.appendTo($("#img1"));
            $("#img_big").css("left", -(img3L - $("#img1").offset().left) * xScale).css("top", -(img3R - $("#img1").offset().top) * yScale);

        });
        $("#img1").mouseleave(function () {
            $("#img2").hide();
            $("#img3").hide();
        });
    });
    function login() {
        alert("请先登录");
        this.location.href = "/index";

    }
</script>
</body>
</html>
