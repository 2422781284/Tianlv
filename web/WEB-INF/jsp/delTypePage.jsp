<%--
  Created by IntelliJ IDEA.
  User: liutao
  Date: 2015/9/17
  Time: 15:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<html>
<head>
    <title></title>
</head>
<style>
  div:hover{
    opacity: 0.6;
  }
</style>
<script>
  function dele(id){
    var xmlhttp;
    if (window.XMLHttpRequest){// code for IE7+, Firefox, Chrome, Opera, Safari
      xmlhttp = new XMLHttpRequest();
    }
    else {// code for IE6, IE5
      xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {
      if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
        var valid = xmlhttp.responseText;
        if(valid="ok"){
          location.reload();
        }

      }
    };
    var s="id="+id.id;
    xmlhttp.open("POST","/delType", true);
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send(s);
  }
</script>
<body>
<c:forEach items="${types}" var="type">
<div id="${type.id}" onclick="dele(this)" style="float: left;width: 15.3%;
padding:0.6%;height:27%;">
  <img src="${type.imgAdr}?rad=<%=System.currentTimeMillis()%>" title=">_<!点我我就消失啦" style="width: 100%;height: 100%">
  <br>
  ${type.name}
</div>
</c:forEach>
</body>
</html>
