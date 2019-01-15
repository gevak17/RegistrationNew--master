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
    <link rel="stylesheet" href="css/login.css"/>

    <title>Авторизація</title>

</head>
<body>

<div class="body1">

    <ul class="nav">
        <a href="/"><li>Перегляд</li></a>
    </ul>
    <h2>Аторизуватись</h2>
<div id="loginMenu">
    <c:url var="loginUrl" value="/login"/>
    <form action="${loginUrl}" method="post">
        <input id="userName" type="text" name="username" placeholder="Логін..." required autofocus>
        <input type="password" name="password" placeholder="Пароль..." required><br><br>
        <input class="findUser" type="submit" value="ВХІД">
        <input type="hidden"
               name="${_csrf.parameterName}"
               value="${_csrf.token}"/>
        <div class="loginError" style="background: red">
            <c:if test="${param.error!=null}">
                <h3>Ваш логін або пароль хибний</h3><%--//!!!!!!--%>
            </c:if>
        </div>
        <div class="loginError" style="background: #2b542c" >
            <c:if test="${param.logout!=null}">
                <h3>Ви вийшли</h3>
            </c:if>
        </div>

    </form>
</div>


<%@include file="head/footer.jsp"%>