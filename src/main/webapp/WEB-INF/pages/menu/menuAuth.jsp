<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<ul class="nav">
    <li><a href="/">Перегляд</a></li>

    <t:authorize access="hasRole('ROLE_USER')">
        <li><a href="/user">Редагування гідрантів</a></li>
    </t:authorize>

    <t:authorize access="hasRole('ROLE_ADMIN')">
        <li><a href="/admin">МЕНЕДЖЕР ПАРОЛІВ</a></li>
    </t:authorize>

    <t:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
        <li><a href="/logout">Вийти</a></li>
    </t:authorize>

</ul>

