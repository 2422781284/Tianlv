<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <meta charset="utf-8">
    <title></title>


</head>
<body style="background-image: url(/image/14.jpg);background-size:contain;overflow: hidden;">
<c:if test="${success}">
    <script>alert("添加成功！");</script>
</c:if>


<br><br>
<div class="sell-div">
    <script src="/js/angular.min.js"></script>
    <form method="post" action="/addItems" enctype="multipart/form-data" ng-app="myApp" ng-controller="validateCtrl"
          style="position: relative;left:700px;top:0px;"
          name="myForm" id="addItems" novalidate>
        <label><b>商品名称</b></b></label> <br><input type="text" name="name" style="width: 330px; height: 23px"
                                                  ng-model="name" required/><span
            ng-show="myForm.name.$error.required">&nbsp;<font color="#FF0000"><font size="2"><font face="黑体">必须哟！</font></font></font></span><br><br>
        <label><b>搜索关键词</b></label> <br><input type="text" name="keyWord" style="width: 330px; height: 23px"
                                               ng-model="keyWord" required/><span
            ng-show="myForm.keyWord.$error.required">&nbsp;<font color="#FF0000"><font size="2"><font
            face="黑体">必须哟！</font></font></font></span><br><br>
        <label><b>商品平均价格</b></label> <br><input type="text" name="price" style="width: 330px; height: 23px"
                                                ng-model="price" required/><span
            ng-show="myForm.price.$error.required">&nbsp;<font color="#FF0000"><font face="黑体"><font
            size="2">必须哟！</font></font></font></span><br><br>
        <label><b>商品选择及标价</b></label><br><input type="text" name="select" style="width: 330px; height: 23px"
                                                ng-model="select" required><span
            ng-show="myForm.select.$error.required">&nbsp;<font color="#FF0000"><font face="黑体"><font
            size="2">必须哟！</font></font></font></span><br><br>
        <label><b>商品描述</b></label><br><input type="text" name="description" style="width: 330px; height: 23px"
                                             ng-model="description" required/><span
            ng-show="myForm.description.$error.required">&nbsp;<font color="#FF0000"><font face="黑体"><font
            size="2">必须哟！</font></font></font></span><br><br>
        <label><b>商品图片</b><font face="黑体"><font size="2">(至少一张至多6张,图片名称1-6.png)</font></font></label><span
            style="color: #ff1145" id="error-img"></span><br><br><input type="file" id="image" name="image"/><input
            type="file" name="image"><br><br><input type="file" name="image"><input type="file"
                                                                                    name="image"><br><br><input
            type="file" name="image"><input type="file" name="image"><br><br>
        <label><b>商品所属分类</b></label><br><br>
        <select name="typeSelect">
            <c:forEach items="${types}" var="type">
                <option value="${type.id}"
                        <c:if test="${(types.get(0).id)==type.id}">selected="selected"</c:if>>${type.name}</option>
            </c:forEach>
        </select><br><br>
        <input type="button" value="提交"
               style="background-image: url(/image/8.png);width: 150px;height: 30px;color:white;font-size: 16px;font-family: 楷书"
               ng-disabled="myForm.name.$error.required||myForm.keyWord.$error.required||myForm.price.$error.required||myForm.select.$error.required||myForm.description.$error.required
" onclick="checkImg()">&nbsp;&nbsp;<input type="reset" value="重置"
                                          style="background-image: url(/image/8.png);width: 150px;height: 30px;color:white;font-size: 16px;font-family: 楷书">

        <script>
            var app = angular.module('myApp', []);
            app.controller('validateCtrl', function ($scope) {
                $scope.select = "示例:红色M码-100|黄色S码-120|...";
            });
            function checkImg() {
                var id = document.getElementById("image");
                if (id.value.length == 0) {
                    document.getElementById("error-img").innerHTML = "至少一张图片";
                } else {
                    document.getElementById("addItems").submit();
                }
            }
        </script>
</div>
</body>
</html>
