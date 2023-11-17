
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>
<div id="message" style="text-align: center">${message}</div>
<form action="register" method="post">
    <label for="username">Ваше имя:</label>
    <input type="text" id="username" name="username" required><br>

    <label for="userlogin">Придумайте логин:</label>
    <input type="text" id="userlogin" name="userlogin" required><br>

    <label for="useremail">Почта :</label>
    <input type="text" id="useremail" name="useremail" required><br>

    <label for="password">Пароль:</label>
    <input type="password" id="password" name="password" required><br>

    <input type="submit" value="Зарегистрироваться">
</form>
</body>
</html>
