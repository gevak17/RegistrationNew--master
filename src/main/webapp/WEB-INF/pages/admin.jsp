<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@include file="head/head.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Менеджер паролів</title>

<style>
    body {
        margin: 0;
    }
    .body1{
        margin: 0 auto;
        overflow: hidden;
        background: darkgrey;
        background-repeat: no-repeat;
        background-position: center;
        background-size: cover;

    }
    h1 {
        font-family: 'Noto Serif', serif;
        text-align: center;
        color: #fff;
        font-size: 52px;
        margin: 0;
    }
    h2{
        font-family: 'Noto Serif', serif;
        /*text-align: center;*/
        color: #fff;
    }
    h3{
        font-family: 'Noto Serif', serif;
        text-align: center;
        color: #786b59;
        margin: 5px;
        background: lightgrey;
        /*font-size: 52px;*/
    }
    .nav{
        margin: 10px auto 10px;
        display: flex;
        justify-content: space-between;
        max-width: 800px;
    }
    li{
        text-decoration: none;
        background-color: rgb(221, 213, 213);
        padding: 10px 16px ;
        list-style-type: none;
        border-radius: 6px;
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



</style>

</head>
<body>

<div class="body1">
        <%@include file="menu/menu.jsp"%>
    <br>
    <h2>Менеджер паролів</h2>

    <table>
        <tr>
            <%--username, password, pidrozdil_id, k_pidrozdil_id, sluzba_id, id_del--%>
            <th>id</th>
            <th>name</th>
            <th>surname</th>
            <th>username</th>
            <th>password</th>
            <th>email</th>
            <th>age</th>
            <th>pidrozdil_id</th>
        </tr>
        <c:forEach items="${allUser}"  var="user">
        <tr>
            <td>${user.id}</td>
            <td>${user.name}</td>
            <td>${user.surname}</td>
            <td>${user.username}</td>
            <td>${user.password}</td>
            <td>${user.email}</td>
            <td>${user.age}</td>
            <td>${user.pidrozdil_id}</td>
            <%--<t:authorize access="hasRole('ROLE_ADMIN')">--%>
                <%--<td><a href="/delete-${user.id}">delete</a></td>--%>
            <%--</t:authorize>--%>
        </tr>
        </c:forEach>
    </table>
<%@include file="head/footer.jsp"%>