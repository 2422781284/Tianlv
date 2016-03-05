<%--
  Created by IntelliJ IDEA.
  User: liutao
  Date: 2015/9/6
  Time: 22:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title></title>
    <style>
        body{
            font-family: 微软雅黑;

        }
        .div {

            width: 98.3%;
            height: 540px;
            border-radius:8px;
            padding: 10px;

        }

        .s-div {
            width: 24.5%;
            height: 330px;
            position: relative;
            background-color: rgb(255, 255, 255);
            text-align: center;
          /*  padding: 5px;*/
            float: left;
        }

        .s-div div {
            position: absolute;
            opacity:0.3;
            top: 0px;

            width:77px;
            height: 330px;
            text-align: center;
            background-size: 100% 100%;
        }

        .s-div div:hover {
            opacity: 0.7;
        }

        label {
            border-radius: 3px;

        }

        button {
            background-color: transparent;
            border: 1px #8f8f8f solid;
            border-radius: 2px;
        }

        button:hover {
            background-color: rgba(217, 221, 221, 0.99);
        }

        .sell-div {
            width:40%;
            height: 530px;
            margin-left: 80px;


        }
        .sell-div input{
            background-color: transparent;
            font-family: 微软雅黑;
            border: 1px solid rgba(171, 165, 168, 0.72);
            border-radius:2px;
            height: 24px;
        }
        .sell-div span{
            color: #ff001d;
        }
        .sell-div input[name="image"]{
            border: none;
            text-decoration: none;

        }
        select{
            font-family: 微软雅黑;
        }
    </style>
    <script>
        var num=1;
        var pre="/upload/${item.id}";
        var last=".png";
        var all=${item.imageNum};
        function change(id){
         if(id.id=="left"){
             if(num==1){num=all;}
             else{num--;}
         }else{
             if(num==all){num=1;}
             else{num++;}
         }
            document.getElementById("img").src=pre+num+last+"?rad="+Math.random();
        }
        function showPrice(id){
            document.getElementById("sPrice").innerHTML=id.value;
        }
    </script>

</head>
<body style="   margin:0px"><br><br>
<c:if test="${ok}"><script>alert("修改成功！")</script></c:if>
<div class="div"/>
<div class="s-div">
    <div style="left:0px;background-image: url(/image/left.png)" id="left" onclick="change(this)"></div>
    <img src="/upload/${item.id}1.png?rad=<%=System.currentTimeMillis()%>" id="img" style="width: 328px;height: 330px;">

    <div style="left:255px;background-image: url(/image/right.png)" id="right" onclick="change(this)"></div>
</div>
<div style="width:380px;height:310px;float: left;padding: 15px;">
    <label>名称:</label>

    <p>${item.name}</p>
    <label>搜索关键字:</label>

    <p>${item.keyWord}</p>
    <label>价格:</label><br><br>
    <button id="sPrice">${item.price}</button>
    <br><br>
    <label>可选类型:</label><br><br>

    <c:forEach items="${arrayList}" var="array">
        <button value="${array[1]}" onclick="showPrice(this)">${array[0]}</button>
    </c:forEach>


</div>

<div style="position: absolute;left:10px;top:388px;width: 48%;height:195px;padding: 10px">
    <label>商品所属分类:</label>

    <br>${sType.name}<br>
    <label>好评度:</label><br>
${com[1]}
   <br>
    <label>总销量:</label><br>
${com[0]}
    <br>
    <label>商品描述:</label><br>

    ${item.description}
</div>
<div style="position: absolute;left: 690px;top: 50px;width: 48%;height: 550px;">
    <br>
    <label style="margin-left: 100px;">修改商品</label>
    <script src="/js/angular.min.js"></script>
    <div class="sell-div">


        <form method="post" action="/editItems?id=${item.id}" enctype="multipart/form-data" ng-app="app" ng-controller="validateCtrler"
              style="position: relative;left: 130px;top:10px;" id="editItems"
              name="myForm" novalidate>
            <label>商品名称</label><br> <input type="text" name="name" ng-model="name" required/><span
                ng-show="myForm.name.$error.required">不为空</span><br>
            <label>搜索关键词</label> <br><input type="text" name="keyWord" ng-model="keyWord" required/><span
                ng-show="myForm.keyWord.$error.required">不为空</span><br>
            <label>商品平均价格</label> <br><input type="text" name="price" ng-model="price" required/><span
                ng-show="myForm.price.$error.required">不为空</span><br>
            <label>商品选择及标价</label><br><input type="text" name="select" ng-model="select" required><span
                ng-show="myForm.select.$error.required">不为空</span><br>
            <label>商品描述</label><br><input type="text" name="description" ng-model="description" required/><span
                ng-show="myForm.description.$error.required">不为空</span><br>
            <label>重新上传图片(至少一张至多6张,图片名称1-6.png)</label><br><input type="file" id="image" name="image"/><span
                id="error-img"></span>
            <br><input type="file"  name="image"><br><input type="file" name="image"><br><input type="file" name="image"><br><input
                type="file" name="image"><br><input type="file" name="image"><br>
            <label>商品所属分类</label><br>
            <select name="typeSelect">
                <c:forEach items="${types}" var="type">
                    <option value="${type.id}"
                            <c:if test="${type.id==sType.id}">selected="selected"</c:if>
                            >${type.name}</option>
                </c:forEach>
            </select><br>
            <input type="button" value="修改" ng-disabled="myForm.name.$error.required||myForm.keyWord.$error.required||myForm.price.$error.required||myForm.select.$error.required||myForm.description.$error.required
" onclick="checkImg()">&nbsp;&nbsp;<input type="reset" value="重置">
        </form>
        <script>
            var app = angular.module('app', []);
            app.controller('validateCtrler', function ($scope) {
                $scope.name ="${item.name}";
                $scope.keyWord ="${item.keyWord}";
                $scope.price ="${item.price}";
                $scope.select ="${item.sel}";
                $scope.description ="${item.description}";
            });
            function checkImg() {
                var id = document.getElementById("image");
                if (id.value.length == 0) {
                    document.getElementById("error-img").innerHTML = "至少一张图片";
                } else {
                    document.getElementById("editItems").submit();
                }
            }
        </script>
    </div>
</div>

</body>
</html>
