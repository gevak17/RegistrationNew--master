<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript" src="js/jqx_6.1.0/jqwidgets/jqxcore.js"></script>
<script type="text/javascript" src="js/jqx_6.1.0/jqwidgets/jqxbuttons.js"></script>
<script type="text/javascript" src="js/jqx_6.1.0/jqwidgets/jqxmenu.js"></script>


<link rel="stylesheet" href="js/jqx_6.1.0/jqwidgets/styles/jqx.base.css" type="text/css" />
<link rel="stylesheet" href="js/jqx_6.1.0/jqwidgets/styles/jqx.energyblue.css" type="text/css" />
<link rel="stylesheet" href="js/jqx_6.1.0/jqwidgets/styles/jqx.orange.css" type="text/css" />


<div id='jqxMenu' style='visibility: hidden;'>
    <ul class="nav" <%--style="float: inherit"--%>>
        <t:authorize access="hasRole('ROLE_USER')">
            <li><a href="/user">Редагування гідрантів</a></li>
            <li><a href="/userMapWork">Робоча карта</a></li>
        </t:authorize>

        <t:authorize access="hasRole('ROLE_ADMIN')">
            <li><a href="/admin">МЕНЕДЖЕР ПАРОЛІВ</a></li>
        </t:authorize>

        <t:authorize access="!hasAnyRole('ROLE_USER','ROLE_ADMIN')">
            <li><a href="/login">Увійти</a></li>
        </t:authorize>

        <li><a href="/testUser">Тестова сторінка</a></li>

        <%--<t:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">--%>
            <%--<li><a href="/logout">Вийти</a></li>--%>
        <%--</t:authorize>--%>


    </ul>
</div>

<script src="js/myJS/welcome.js"></script>