<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" uri="http://www.springframework.org/security/tags" %>
<!doctype html>
<html lang="ua">
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Авторизація</title>
<style>
    body {
        margin: 0;
    }
    .body1{
        max-width: 1920px;
        height: 949px;
        margin: 0 auto;
        overflow: hidden;
        background: url(https://image.ibb.co/cqFY0S/bg.jpg);
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;

    }
    h1{
        font-family: 'Noto Serif', serif;
        text-align: center;
        color: #fff;
        font-size: 44px;
        margin: 0;
    }
    h2{
        font-family: 'Noto Serif', serif;
        text-align: center;
        color: #fff;
        font-size: 52px;
    }
    .nav{
        margin: 50px auto;
        display: flex;
        justify-content: space-around;
        max-width: 800px;
        /* height: 500px; */
        /* background-color: palevioletred; */
    }
    li{
        text-decoration: none;
        background-color: rgb(221, 213, 213);
        padding: 10px 16px ;
        list-style-type: none;
        border-radius: 6px;
        /* cursor: pointer; */


    }

    li:hover {
        background: #f19a20;
    }
    a{
        font-family: 'Noto Serif', serif;
        font-weight: 700;
        font-size: 18px;
        color: rgb(3, 7, 70);
        text-decoration: none;

    }
    input{
        font-family: 'Noto Serif', serif;
        font-weight: 800;
        font-size: 16px;
        color: #0010f0;
        background-color: rgb(221, 213, 213);
        width: 250px;
        border-radius: 3px;
        /*text-transform: uppercase;*/
        padding: 10px 17px ;
        cursor: pointer;
        margin-left: 7px;
    }
</style>
</head>
<body>

<div class="body1">
    <%@include file="menu/menuAuth.jsp"%>
<center>
    <h2>Аторизуватись</h2>

    <c:url var="loginUrl" value="/login"/>
<form action="${loginUrl}" method="post">
    <input id="userName" type="text" name="username" placeholder="Логін..." required autofocus>
    <input type="password" name="password" placeholder="Пароль..." required><br><br>
    <input class="findUser" type="submit" value="ВХІД">
    <input type="hidden"
           name="${_csrf.parameterName}"
           value="${_csrf.token}"/>

    <c:if test="${param.error!=null}">
        <h3>Ваш логін або пароль хибний</h3><%--//!!!!!!--%>
    </c:if>
    <c:if test="${param.logout!=null}">
        <h3>Ви вийшли</h3>
    </c:if>


</form>



</center>

<%@include file="head/footer.jsp"%>