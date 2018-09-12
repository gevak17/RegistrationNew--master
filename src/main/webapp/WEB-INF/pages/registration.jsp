<%--
<%@include file="head/head.jsp"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>Реєстрація</title>

</head>
<body>

<div class="body1">
    <%@include file="menu/menu.jsp"%>
    <h1>Заєриструватися</h1>
<center>
<form action="/save" method="post">
    Введіть username:<input type="text" name="username" placeholder="username..."><br>
    Введіть password:<input type="password" name="password" placeholder="password..."><br>
    Введіть email:<input type="email" name="email" placeholder="email..."><br>
    Введіть name:<input type="text" name="name" placeholder="name..."><br>
    Введіть surname:<input type="text" name="surname" placeholder="surname..."><br>
    Введіть age:<input type="number" name="age" placeholder="age..."><br>
    Введіть pidrozdil_id:<input type="number" name="pidrozdil_id" placeholder="pidrozdil_id..."><br>
    &lt;%&ndash;Enter id_del:<input type="bool!!!!" name="id_del" placeholder="id_del"><br>&ndash;%&gt;
    <input type="submit" value="Заєриструватись">
    <input type="hidden"
           name="${_csrf.parameterName}"
           value="${_csrf.token}"/>
</form>
    &lt;%&ndash;<th>id</th>&ndash;%&gt;
    &lt;%&ndash;<th>username</th>&ndash;%&gt;
    &lt;%&ndash;<th>password</th>&ndash;%&gt;
    &lt;%&ndash;<th>email</th>&ndash;%&gt;
    &lt;%&ndash;<th>name</th>&ndash;%&gt;
    &lt;%&ndash;<th>surname</th>&ndash;%&gt;
    &lt;%&ndash;<th>age</th>&ndash;%&gt;
</center>

<%@include file="head/footer.jsp"%>
--%>
