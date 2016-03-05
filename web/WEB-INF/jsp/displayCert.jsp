<%@ page import="tian.table.User" %>
<%--
  Created by IntelliJ IDEA.
  User: liutao
  Date: 2015/9/14
  Time: 8:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%User user = (User) session.getAttribute("user");%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>


    <style>
        body {
            font-family: 微软雅黑;
            font-size: 18px;
        }

        .big-div {
            margin: 0px auto;

            width: 75%;
            height: 108px;
            background-color: rgba(202, 202, 202, 0.1);
            border: 1px solid rgba(118, 117, 122, 0.38);
            border-radius: 2px;
            padding: 5px;
        }

        .big-div input {
            float: left;
            position: relative;
            top: 40px;

        }

        .big-div img {
            width: 100px;
            float: left;
        }

        .big-div button {
            background-color: transparent;
            border-radius: 2px;
            border: 1px solid #bbc0c1;

        }

        #total-div {
            position: absolute;
            right: 169px;
            top:1px;
            width: 260px;
            height: 300px;
            background-color: rgb(245, 245, 245);
            border: 1px solid #fefdff;
            border-radius: 5px;
            text-align: center;
            display: none;
        }
        #total-div input{
            background-color: transparent;
            height: 23px;
            border-radius: 3px;
            border:1px solid #b7b4bd;
            font-family: 微软雅黑;
            font-size: 15px;

        }

        .bt {
            border-radius: 2px;
            font-family: 微软雅黑;
            font-size: 18px;
            background-color: transparent;
            border: 1px solid #b1aeb1;
        }

        .bt:hover {
            background-color: #eef1f1;
        }
    </style>
    <script src="/js/jquery-1.11.3.js"></script>
    <script>
        function changeShow() {
            var sel = document.getElementsByName("select");
            var count = 0;
            var temp;
            var tempV;
            var price;
            var num;
            for (var i = 0; i < sel.length; i++) {

                temp = sel[i];
                if (temp.checked == true) {
                    tempV = temp.value;
                    price = parseFloat(document.getElementById(tempV).innerHTML);
                    num = parseInt(document.getElementById(tempV + "0").innerHTML);
                    count += price * num;
                }

            }
            document.getElementById("show").innerHTML = count;
        }
        function buyItems() {
            document.getElementById("total-div").style.display = "block";
            document.getElementById("total").innerHTML = document.getElementById("show").innerHTML;

        }
        var pays = 0;
        function pay() {
            pays = 1;
        }
        function check() {
            var records = "";
            var checkBox = document.getElementsByName("select");
            for (var i = 0; i < checkBox.length; i++) {
                if (checkBox[i].checked == true) {
                    records += checkBox[i].value + "-";
                }
            }
            var tele = document.getElementById("telephone").value;
            var addr = document.getElementById("address").value;
            var xmlhttp;
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            }
            else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    var valid = xmlhttp.responseText;
                    if (valid == "ok") {
                        alert("购买成功!");
                        location.reload();
                    }

                }
            };

            var s = "pay=" + pays + "&records=" + records + "&tele=" + tele + "&addr=" + addr;
            xmlhttp.open("POST", "/changeToDone", true);
            xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xmlhttp.send(s);
        }
        function deleteR() {
            var records = "";
            var checkBox = document.getElementsByName("select");
            for (var i = 0; i < checkBox.length; i++) {
                if (checkBox[i].checked == true) {
                    records += checkBox[i].value + "-";
                }
            }
            var xmlhttp;
            if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                xmlhttp = new XMLHttpRequest();
            }
            else {// code for IE6, IE5
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            xmlhttp.onreadystatechange = function () {
                if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                    var valid = xmlhttp.responseText;
                    if (valid == "ok") {
                        alert("删除成功！");
                        location.reload();
                    }

                }
            };

            var s = "records=" + records;
            xmlhttp.open("POST", "/deleteR", true);
            xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xmlhttp.send(s);

        }
    </script>
</head>
<body>
<div style="float:right;position: relative;right: 160px;">
    <span id="show">0</span>&nbsp;
    <button class="bt" onclick="deleteR()">删除</button>
    &nbsp;&nbsp;
    <button class="bt" onclick="buyItems()">去结算</button>
</div><br><br>
<c:forEach items="${arrayList}" var="array">
    <div class="big-div">
        <input type="checkbox" name="select" value="${array[2]}" onclick="changeShow()"><a
            href="/displayItem?id=${array[3]}"><img src="/upload/${array[3]}1.png?rad=<%=System.currentTimeMillis()%>"></a>
            ${array[0]}
        <br>
            ${array[1]}<br>
            ${array[4][0]}<br>
        <button id="${array[2]}">${array[4][1]}</button>
        *
        <button id="${array[2]}0">${array[5]}</button>
    </div>
    <br>
</c:forEach>


<div id="total-div">
    <img src="/image/close.png" style="width: 30px;height: 30px;position: inherit;right: 0px;top: 0px;"
         onclick="document.getElementById('total-div').style.display='';">
    <br>

    总计:<span id="total"></span><br><br>
    <script src="/js/angular.min.js"></script>
    <form ng-app="myApp" ng-controller="validateCtrl" name="myForm" novalidate>
        联系电话:<br><input type="text" id="telephone" name="telephone" ng-model="telephone" required><br><span
            style="color: red" ng-show="myForm.telephone.$error.required">不为空</span><br>
        收件地址:<br><input type="text" id="address" name="address" ng-model="address" required><br><span style="color: red"
                                                                                                      ng-show="myForm.address.$error.required">不为空</span><br>
        <input type="button" value="付款" onclick="pay()"
               ng-disabled="myForm.address.$error.required||myForm.telephone.$error.required"/><br><br>
        <input type="button" onclick="check()" value="确认订单"
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
</body>
</html>
