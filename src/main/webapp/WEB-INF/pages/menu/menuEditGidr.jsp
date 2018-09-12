<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<t:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
    <div id="pravaUser">
        <h3 style="width: 100%; height: 50px">
            Користувач може редагувати гідранти, які є в межах виїзду<br>
            <c:forEach items="${user}" var="user">
                Підрозділ - № ${user.pidrozdil_id},
            </c:forEach>
        </h3>
    </div>


</t:authorize>

<ul class="nav">

    <li><a href="/">Перегляд</a></li>

    <t:authorize access="hasRole('ROLE_ADMIN')">
        <li><a href="/admin">МЕНЕДЖЕР ПАРОЛІВ</a></li>
    </t:authorize>

    <t:authorize access="!hasAnyRole('ROLE_USER','ROLE_ADMIN')">
        <li><a href="/login">Увійти</a></li>
    </t:authorize>



    <t:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
        <li><a href="/logout">Вийти</a></li>
    </t:authorize>

</ul>
<ul class="nav">
    <t:authorize access="hasAnyRole('ROLE_USER','ROLE_ADMIN')">
        <li id="dovidkaButton" onClick="toggle_show('dovidka2')">Довідка</li>
        <li onClick="toggle_show('pravaUser')" id="pravaButton" style="text-align: center; border-radius: 5px; padding: 5px; margin: 5px">Що я можу редагувати?</li>
    </t:authorize>
</ul>
