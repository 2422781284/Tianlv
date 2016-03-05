<%--
  Created by IntelliJ IDEA.
  User: liutao
  Date: 2015/9/3
  Time: 0:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>天驴商城</title>
  <style>
    .btn{
      width: 60px;
      outline-width: 50px;
      outline-color: cyan;
      border-top-left-radius:0.5em;
      border-top-right-radius:0.5em;
      border-bottom-left-radius:0.5em;
      border-bottom-right-radius:0.5em;
      background-color: #fffd92;
      border-color: #fff827;
      border-width: thick;
      cursor: hand;
    }
    .btn:hover{
      background-color: #ffff79;
      border-color: #fff827;
      color: #ff970a;
    }
    .text{
      border: dashed;
      border-width: thin;
      border-color: #fff827;
      width: 180px;
      height: 23px;
    }
    .file {
      position: relative;
      display: inline-table;
      left: 0px;
      background: rgba(255, 181, 245, 0.12);
      border: 1px solid  #ffce1d;
      padding: 4px 8px;
      border-radius: 5px;
      overflow: hidden;
      text-decoration: none;
      text-indent: 0;
      text-align: center;
      line-height: 21px;
      color: black;
      border-bottom-style: hidden;
    }
    .file input {
      position: absolute;
      font-size: 80px;
      right: 0;
      top: 0;
      opacity: 0;
    }
    .file:hover {
      background: #fdddf5;
      border-color:  #ffce1d;
      color: rgba(221, 91, 91, 0.83);
      text-decoration: none;
    }

  </style>
</head>

<body  style="background-color: #fdffbf">
<div  style="background-color: rgba(255, 31, 238, 0.12);width: 60%;margin: 15px auto;height: 600px;">
  <br><center>
  <form method="post" action="/addType" enctype="multipart/form-data">
    <p style="font-family: 黑体;"><b>商品分类：</b><input type="text"  name="typeName"  /><br><br></p>
    <a href="javascript:; " class="file">选择文件 <input type="file" class="file"  name="typeImg" />&nbsp;</a>
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <input type="submit" class="btn"  value="添加" />
  </form>
  <div style="margin: 0px auto">
    <img src="${src}" style="width: 400px;height: 400px;border: dashed;"/>
  </div></center>
</div>
</body>
</html>
