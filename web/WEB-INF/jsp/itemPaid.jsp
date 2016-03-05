<%--
  Created by IntelliJ IDEA.
  User: liutao
  Date: 2015/9/15
  Time: 9:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title></title>
  <style>
    body{
      font-family: 微软雅黑;
      overflow: hidden;

    }
    a{
      text-decoration:none;
      color: black;
    }
    .left-div{

      width:69%;
      height:600px;
      overflow-y:scroll;
      float: left;
    }
    .left-div div{

      width:99.5%;
      height: 110px;



    }
    .left-div div img{
      height: 110px;
      width: 110px;
      float: left;
    }
    .left-div div button{
      background-color: transparent;
         font-family: 微软雅黑;
      border: 1px solid rgba(126, 126, 126, 0.67);
      border-radius: 2px;
    }
    iframe{
      position: absolute;
      right: 0px;
      top: 50px;
      float: right;
      border: none;
      width:31%;
      height:600px;

    }
    #big-div{
      width:100%;
      height:600px;
      padding: 2px;
      background-color: rgba(0, 0, 0, 0.08);
      display: none;
    }
    #comment{
      position:absolute;
      left: 480px;
      top: 200px;
      width: 300px;
      height: 200px;
      border-radius: 8px;
      background-color: rgb(250, 255, 255);
      display: none;
      padding: 10px;

    }
    #comment .img{
      position:inherit;
      right: 0px;
      top: 0px;
      width: 30px;
      height: 30px;
    }
    #comment button{
      background-color: transparent;
      font-family: 微软雅黑;
      border:1px solid rgba(159, 154, 160, 0.65);
      border-radius: 2px;
    }
    #comment input{
      background-color: transparent;
      font-family: 微软雅黑;
      border:1px solid rgba(159, 154, 160, 0.65);
      border-radius: 2px;
      width: 200px;
      height: 35px;
    }

  </style>
  <script>
    var xmlhttp;
    if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
      xmlhttp = new XMLHttpRequest();
    }
    else {// code for IE6, IE5
      xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
   /* xmlhttp.onreadystatechange = function () {
      if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        var valid = xmlhttp.responseText;
        if(valid=="ok"){
          alert("删除成功!");
          location.reload();
        }

      }
    };*/
    function paying(id){
      var record=id.parentNode.id;
      xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
          var valid = xmlhttp.responseText;
          if(valid=="ok"){
            alert("付款成功！");
            location.reload();
          }

        }
      };
      var s="record="+record;
      xmlhttp.open("POST","/doneToPaid", true);
      xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
      xmlhttp.send(s);


    }
    function deling(id){
      var record=id.parentNode.id;
      xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
          var valid = xmlhttp.responseText;
          if(valid=="ok"){
            location.reload();
          }

        }
      };
      var s="record="+record;
      xmlhttp.open("POST","/deleteDone", true);
      xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
      xmlhttp.send(s);


    }


    var whichC;
    function showC(id){
      document.getElementById("big-div").style.display="block";
      document.getElementById("comment").style.display="block";
      whichC=id.parentNode.id;

    }
    function closeC(){
      document.getElementById("big-div").style.display="none";
      document.getElementById("comment").style.display="none";
    }
    var countStar=0;
    function star(id){
      var src=id.src;
      if(src.match("wstar.png")){
        id.src="/image/ostar.png";
        countStar++;
      }else{
        id.src="/image/wstar.png";
        countStar--;
      }

    }
    function comming(){
      var comm=document.getElementById("mycomm").value;

      xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
          var valid = xmlhttp.responseText;
          if(valid=="ok"){
            alert("发表成功！");
            location.reload();
          }

        }
      };
      var s="record="+whichC+"&count="+countStar+"&comm="+comm;
      xmlhttp.open("POST","/commDone", true);
      xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
      xmlhttp.send(s);

    }
  </script>
</head>
<body>

<div class="left-div">
  <c:forEach items="${arrayList}" var="array">
  <div id="${array[2]}">
    <a href="/displayItem?id=${array[3]}"><img src="/upload/${array[3]}1.png?rad=<%=System.currentTimeMillis()%>"></a>
    ${array[0]}<br>
    ${array[1]}<br>
    ${array[5][0]}<br>
    ${array[5][1]}*${array[6]}<br>
   <c:choose>
     <c:when test="${array[4]==0}"><button onclick="paying(this)">付款</button>&nbsp;<button onclick="deling(this)">删除</button></c:when>
    <c:otherwise>
      <c:if test="${array[7]==0}"><button onclick="showC(this)">评价</button></c:if>
    </c:otherwise>
   </c:choose>
    &nbsp;<button><a href="/lookingRecord?id=${array[2]}" target="rec">查看订单</a></button>
  </div>
  <br> </c:forEach>

</div>
<div id="big-div">
  <div id="comment">
    <img class="img" src="/image/close.png" onclick="closeC()"><br>
    送星星:<br>
    <img src="/image/wstar.png" onclick="star(this)">
    <img src="/image/wstar.png" onclick="star(this)">
    <img src="/image/wstar.png" onclick="star(this)">
    <img src="/image/wstar.png" onclick="star(this)">
    <img src="/image/wstar.png" onclick="star(this)"><br>
    评论一番吧<br>
    <input type="text" id="mycomm"><br><br>

    <button onclick="comming()">发表评论</button>


  </div></div>

<iframe name="rec"/>
</body>
</html>
