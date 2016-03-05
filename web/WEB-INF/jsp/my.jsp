<%@ page import="tian.table.User" %>
<%--
  Created by IntelliJ IDEA.
  User: liutao
  Date: 2015/9/1
  Time: 21:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<% User user = (User) session.getAttribute("user");%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <style>
     /*   * {
            font-family: 微软雅黑;
        }

        body {
            overflow: hidden;
        }

        .kuang {
            height: 25px;
            background-color: transparent;
            border: 1px solid #c4c2cc;
            border-radius: 3px;
            color: #d1d5dc;
        }

        .ul {
            list-style: none;
            margin-left: 0px;
            float: left;
            margin-top: 6px;
            color: #fbffff;
        }

        .ul li {
            float: left;
            border-right: 1px #8e8e8e solid;
            padding-left: 8px;
            padding-right: 8px;
        }

        .ul li a {
            text-decoration: none;
            color: #fbffff;
        }

        .ul li a:hover {

            color: #8c9090;
        }

        .div {


            background:black;
            width: 100%;
            height: 30px;
        }

        #editInf {
            position: absolute;
            left: 716px;
            top: 30px;

            padding-left: 20px;
            background-color: rgb(0, 0, 0);
            color: white;
            width: 238px;
            height: 190px;
            z-index: 2;
            display: none;
        }

        #editInf input {
            border: 1px solid #fbfff9;
            border-radius: 3px;
            height: 23px;
            background-color: transparent;
            color: white;
        }*/
     * {
         font-family: 微软雅黑;
     }

     body {
         overflow: hidden;
     }

     .kuang {

         height:90%;
         background-color: transparent;
         border: 1px solid #ffffff;
         border-radius: 3px;
         color: #d1d5dc;

     }

     .ul {
         list-style: none;
         margin-left: 0;
         float: left;
         margin-top:0.5%;
         width: 80%;
         height:80%;
         color: #fbffff;

     }

     .ul li {
         float: left;
         border-right: 1px #8e8e8e solid;

         padding-right:1%;
     }

     .ul li a {
         text-decoration: none;
         color: #fbffff;
     }

     .ul li a:hover {

         color: #8c9090;
     }

     .div {
         background:black;
         width: 100%;
         height:4.5%;

     }

     #editInf {
         position: relative;
         left: 51%;
         top:100%;
         width: 16%;
         height: 580%;


         background-color: rgb(0, 0, 0);
         color: white;

         z-index: 2;
        
     }
   #editInf form{
       position: relative;
       left: 13%;

top:-22%;
   }
     #editInf div{
         top:-28%;

     }
     #editInf input {
         border: 1px solid #f6faff;
         border-radius: 3px;
         height:15%;
         background-color: transparent;
         color: white;
     }
    </style>
    <script>
        function editInf() {
            var telephone = document.getElementById("telephone").value;
            var address = document.getElementById("address").value;
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
                        alert("编辑成功！");
                        document.getElementById("editInf").style.display = "none";
                    }

                }
            };
            var str = "telephone=" + telephone + "&address=" + address;
            xmlhttp.open("POST", "/editInf", true);
            xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            xmlhttp.send(str);
        }

    </script>
</head>
<!--<body style="margin:0px">-->
<body style="margin:0">

<div class="div">
    <ul class="ul">
        <li>&nbsp;<a href="/myIndex" target="section">首页</a>&nbsp;</li>
        <c:if test="${user.userType==2}">
            <li style="border: none">
                <div onmouseenter="document.getElementById('adm').style.display='';"
                     onmouseleave="document.getElementById('adm').style.display='none';">
                    &nbsp;管理分类&nbsp;<br>
                   <!-- <div id="adm" style="position: relative;top: 2px;display: none;z-index:3;">-->
                    <div id="adm" style="position: relative;top:2%;display: none;z-index:3;">
                        <!--<div style="width: 73px;height:25px;background:black">-->
                        <div style="width:113%;height:100%;background:black;padding-top: 10%;">
                            <a href="/addTypePage" target="section">&nbsp;&nbsp;添加&nbsp;</a>

                        </div>
                        <div style="width:113%;height:100%;background:black;">

                            <a href="/delTypePage" target="section">&nbsp;&nbsp;删除&nbsp;</a>
                        </div>
                    </div>
                </div>
            </li>
        </c:if>
   <li style="border-left:1px #797979 solid; ">&nbsp;<a href="/displayCert" target="section">购物车</a>&nbsp;</li>
        <li>&nbsp;<a href="/itemPaid" target="section">已购宝贝</a>&nbsp;</li>
        <li>&nbsp;<a href="/sell" target="section">我要卖东西</a>&nbsp;</li>
        <li>&nbsp;<a href="/mySell?ok=''" target="section">我卖过的</a>&nbsp;</li>
        <li>&nbsp;<a href="/handOut" target="section">未发货订单</a>&nbsp;</li>
        <li>&nbsp;<a href="/sellerChat" target="section">消息</a>&nbsp;</li>
        <li>&nbsp;<a href="/index">退出</a>&nbsp;</li>
        <li>&nbsp;欢迎!${user.name}&nbsp;</li>
        <li>&nbsp;
            <!--<button class="kuang" style="height:21px;"
                    onclick="document.getElementById('editInf').style.display='block'">-->
            <button class="kuang" style="height:90%;font-size:80%;"
                    onclick="document.getElementById('editInf').style.display='';">
                编辑信息
            </button>
            &nbsp;</li>

    </ul>
    <!--<form style="float: right;margin-top: 2px;" action="/search" method="post" target="section">-->
    <form style="float: right;" action="/search" method="post" target="section">
        <input type="search" name="search" class="kuang">&nbsp;<input type="submit" class="kuang" value="搜索"></form>

    <script src="/js/angular.min.js"></script>
   <div id="editInf" style="display: none;">
       <!-- <img src="/image/close.png" style="width: 30px;height: 30px;position: inherit;right: 0px;top: 0px;"
             onclick="document.getElementById('editInf').style.display='none'">-->
        <div style="position: relative;width:10%;height: 10%"><img src="/image/close.png" style="width:100%;height: 100%"
             onclick="document.getElementById('editInf').style.display='none'"></div>


        <form method="post" ng-app="myApp"  ng-controller="validateCtrl" name="myForm" novalidate>


            联系电话:<br><input type="text" id="telephone" name="telephone" ng-model="telephone" required><br><span
                style="color: #ff0020" ng-show="myForm.telephone.$error.required">电话不能为空</span><br>
            收件地址:<br><input type="text" id="address" name="address" ng-model="address" required><br><span
                style="color: #ff0027" ng-show="myForm.address.$error.required">地址不能为空</span><br>

            <input type="button" onclick="editInf()" value="提交"
                   ng-disabled="myForm.address.$error.required||myForm.telephone.$error.required"/>
        </form>
        <script>
            var app = angular.module('myApp', []);
            app.controller('validateCtrl', function ($scope) {

            });
        </script>
    </div>
</div>
<iframe src="/myIndex" name="section"
        style="position: absolute;left:0px;top:4.5%;border:none;width: 100%;height:95.5%;z-index:1"/>
<!--<iframe src="/myIndex" name="section"
        style="position:relative;left:0;top:0;border:none;width: 100%;height:95%;margin-top:0;padding:0;z-index:1"/>-->
</body>
</html>
