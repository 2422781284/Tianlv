<%--
  Created by IntelliJ IDEA.
  User: liutao
  Date: 2015/9/16
  Time: 10:24
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
     background-image: url(/image/louti.png?rad=<%=System.currentTimeMillis()%>);
      background-size: cover;
overflow: hidden;
    }
    .big-div{
      position:relative;
      top:95px;
      float: right;
      margin-right:0px;
      width:83%;
      height: 550px;

      overflow: hidden;

    }
    .inline-div{

      width:102%;
      height: 550px;
      overflow-y:auto;

    }
    .little-div{
      position:relative;
      float: left;
      background-image: url(/image/kuang.png);
      background-size:100% 100%;
      width:250px;
      height:265px;
      text-align: center;
      overflow: hidden;
      border:1px outset #cd983d;
      border-radius:3px;
      margin-right: 27px;
      margin-bottom: 23px;

    }
    .little-div img{
      position:relative;
      top: 15px;
      width:225px;
      height:230px;
      border-radius:3px;
    }
    .little-div img:hover{
      -webkit-filter: blur(3px);
    }
    .little-div div{
      position:absolute;
      width: 228px;
      height: 154px;
      top: 90px;
      left: 10px;

    }
    .little-div div:hover{
      background-color: rgba(255, 255, 255, 0.75);
    }
  #back{
      position: absolute;
      right:40px;
     top:18px;
      width: 60px;
      height: 60px;
      opacity: 0.5;
      display: none;

  }
    #back:hover{
        opacity: 1;
    }
  </style>
    <script>
        function showBack(id){
            if(id.scrollTop>100){
              document.getElementById("back").style.display="block";
            }else{
                document.getElementById("back").style.display="none";
            }
        }
    </script>
</head>

<body>

<div class="big-div">
  <div id="inline-div" onscroll="showBack(this)" class="inline-div">
    <c:forEach items="${arrayList}" var="array">
      <div class="little-div">
      <a href="/displayItem?id=${array[0]}">
        <img src="/upload/${array[0]}1.png?rad=<%=System.currentTimeMillis()%>">
        </a>
        <div>
          ${array[1]}<br>
          ${array[2]}<br>
         价格: ${array[3]}<br>
            好评度:
            <c:choose>
              <c:when test="${array[4][1]==null}">
                暂无
              </c:when>
              <c:otherwise>
                ${array[4][1]}
              </c:otherwise>
            </c:choose>

              ${array[4][0]} 人付款
        </div>

      </div>
    </c:forEach>

  </div>
</div>
<img src="/image/back-top.png"  id="back" onclick="document.getElementById('inline-div').scrollTop=0;"/>

</body>
</html>
