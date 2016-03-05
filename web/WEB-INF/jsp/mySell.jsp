<%@ page import="tian.table.User" %>
<%--
  Created by IntelliJ IDEA.
  User: liutao
  Date: 2015/9/6
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<% User user=(User)session.getAttribute("user");%>
<html>
<head>
    <title></title>
  <style>
    body{
      font-family: 微软雅黑;

    }
    .div {
      float: left;
      position: relative;
      padding: 14px;

      border-radius: 45px;
      background:rgba(209, 213, 220, 0.2);

    }

    .div div {
      position: absolute;
      left: 14px;
      top: 190px;
      width: 240px;
      height:65px;

      text-align: center;
      color: #fbffff;
    }
    .div:hover{
      opacity: 0.8;
    }

    .div div:hover{
    background-color: rgba(28, 28, 28, 0.8);
    }
    .big-div{
      background:rgba(209, 213, 220, 0.2);
      width: 80.5%;
      height:auto;
      margin: 0px auto;
      border-radius: 8px;
      padding: 14px;
    }
    .img{
      width: 240px;
      height: 240px;
    }
    a{
      text-decoration: none;
    }
    a:link{
      color: white;
    }
    a:visited{
      color: white;
    }
  </style>
</head>
<body style="background-image: url(/image/tree1.jpg);">
<c:if test="${ok}"><script>alert("删除成功！");</script></c:if>
<br><br>
<div class="big-div">
<c:forEach items="${items}" var="item">
  <div class="div">

   <a href="/sellItem?id=${item[0]}&ok=''"><img src="/upload/${item[0]}1.png?rad=<%=System.currentTimeMillis()%>" class="img"></a><br>
    <div>
     ${item[1]}<br>
      ${item[2]}<br>
       <a href="/deleteItem?id=${item[0]}">删除</a>
    </div>

  </div>

</c:forEach>
  </div>
</body>
</html>
