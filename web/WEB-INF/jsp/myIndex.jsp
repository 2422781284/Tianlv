<%--
  Created by IntelliJ IDEA.
  User: liutao
  Date: 2015/9/4
  Time: 14:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title></title>
  <style>
    body{
      font-family:微软雅黑;
      font-size: 16px;
      color: #8d8d8d;
      text-align: center;
    }
    .ig{
      border-radius: 8px;

      width: 180px;
      height: 100px;
      -webkit-filter: blur(2px); /* Chrome, Opera */
      -moz-filter: blur(2px);
    }
    hr{
      display: inline-block;
      width: 45%;
      text-align: center;
    }
    .big-div{
      position: relative;
      float: left;
      padding-left:37px;
      padding-top: 8px;
      padding-bottom: 16px;


    }
    .big-div div{

      position: absolute;
      left:50px;
      width: 150px;
      top: 42px;
      text-align: center;
      font-family:微软雅黑;
      font-size: 23px;
      color: #eaf7ff;
      font-weight:400;
    }
    .big-div div:hover{
      color: #282e2f;

    }
    .ig:hover{
      -webkit-filter: blur(0px);
    }

    .items-div{
    /*  background-image: url(/image/feng.png);*/
      background-size: cover;
      border-radius: 5px;
      width:96%;
      height:650px;
      margin: 0px auto;
      padding: 20px;


    }
    .item-div{
      float: left;

      width: 298px;
      height: 320px;
      opacity: 0.8;
      padding-left: 10px;
      padding-right:1px;
      padding-top: 4px;

  border-radius:8px;
      position: relative;
      font-family: 微软雅黑;
      font-size: 18px;
      color: #ffffff;
      text-align: center;
    }
    .item-div:hover{

      opacity:1;
    }
    .item-div img{
      width: 296px;
      height: 290px;


    }
    .item-div div{
      position: absolute;
      left: 10px;
      top:170px;

      width:298px;
      height:124px;
      text-align: center;
     /* background-color: rgba(40, 46, 47, 0.4);*/
    }
    .item-div div:hover{
      background-color: rgba(40, 46, 47, 0.8);
    }
    .item-div label{
      border-right:1px #91999a solid;
    }
  </style>
</head>
<body>

<hr>
商品分类
<hr><br><br>
<c:forEach items="${types}" var="type">
  <div class="big-div">
 <a href="/typeItems?id=${type.id}"><img src="${type.imgAdr}?rad=<%=System.currentTimeMillis()%>" class="ig"></a>
  <div>${type.name}</div>
</div>
</c:forEach>
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

<hr>最新上架<hr><br><br>
<div class="items-div">
  <c:forEach items="${items}" var="item">
  <a href="/displayItem?id=${item.id}"><div class="item-div">
    <img src="/upload/${item.id}1.png?rad=<%=System.currentTimeMillis()%>">
    <div>${item.name}<br>
      ${item.keyWord}<br>
      价格:${item.price}<br>
      好评度:
        <c:choose>
          <c:when test="${item.star=='null'}">
             暂无
          </c:when>
          <c:otherwise>
            ${item.getStar()}
          </c:otherwise>
        </c:choose>

    &nbsp;
    ${item.getSales()} 人付款
    </div>

  </div></a></c:forEach>
</div>
</body>
</html>
