<%--
  Created by IntelliJ IDEA.
  User: galim
  Date: 16.11.2023
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <style>
        .login_form-block{
            margin: 0 auto;
        }
    </style>
</head>
<body>
<div class="login_form-block">
    <form action="login" method="post">

        <h2 style="text-align: center">Пожалуйста, авторизуйтесь</h2>

        <label for="userlogin">Введите логин:</label>
        <input type="text" id="userlogin" name="userlogin" required><br>

        <label for="password">Введите пароль:</label>
        <input type="password" id="password" name="password" required><br>

        <input type="submit" value="Войти">
    </form>
</div>
<a href="registration.jsp">Регистрация</a>
</body>

</html>

