<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Профиль</title>
    <style>
        body{
            padding: 0;
            margin: 0;
        }
        .profileContainer {
            max-width: 400px;
            margin: 0 auto;
            margin-top: 100px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        h3 {
            text-align: center;
        }

        table {
            margin: 0 auto;
            width: 100%;
        }

        th,
        td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ccc;
            color: black;
        }

        th {
            font-weight: bold;
        }

        .hidden {
            display: none;
        }

        .visible {
            display: inline-block;
            color: blue;
            cursor: pointer;
        }
        .navbar{
            width:100%;
            height:50px;
            box-shadow: 0 4px 10px rgba(0,0,0, .1);
            background-color: mediumpurple;
            padding: 0;
            margin: 0;

        }

        .navbar .container{
            height:inherit;
            display:flex;
            justify-content: space-between;
            align-items:center;
            margin-right: 100px;



        }
        .navbar-menu{
            list-style-type:none ;
            padding-left: 0;
            margin-bottom:0;

        }
        .navbar-menu li{
            display:inline-block;
            color: black;
            opacity: 0.8;
            text-decoration: none;
        }
        .navbar-menu li a{
            display:inline-block;
            color: black;
            opacity: 0.8;
            text-decoration: none;
            padding: 10px;
            font-size: 18px;
        }
        .navbar-brand{
            font-weight: 700;
            font-size: 30px;
            text-decoration: none;
            color:black;
            margin-left: 100px;}
    </style>
    <script>
        function togglePassword() {
            var passwordField = document.getElementById("passwordField");

            if (passwordField.classList.contains("hidden")) {
                passwordField.classList.remove("hidden");
            } else {
                passwordField.classList.add("hidden");
            }
        }

        function showChangePasswordForm() {
            var renameForm = document.getElementById("rename_form");
            renameForm.style.display = "block";
        }

    </script>
</head>
<div>
    <nav class = "navbar">
        <div class = "container">
            <a href = "#" class = "navbar-brand">Forum</a>

            <div class = "navbar-wrap">
                <ul class = "navbar-menu">
                    <li><a href = "homePage">Главная страница</a></li>
                    <li><a href = "myPost">Мои посты</a></li>
                    <li><a href = "exit">Выйти</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<body>
<div id="profileContainer" class="profileContainer">
    <h3>Ваш профиль</h3>
    <table>
        <tr>
            <th>Название</th>
            <th>Ваши данные</th>
        </tr>
        <tr>
            <td>id</td>
            <td>${profiles.id!"Ваш id"}</td>
        </tr>
        <tr>
            <td>Полное имя</td>
            <td>${profiles.fullName!"Ваше полное имя"}</td>
        </tr>
        <tr>
            <td>Логин</td>
            <td>${profiles.login!"Ваш логин"}</td>
        </tr>
        <tr>
            <td>Почта</td>
            <td>${profiles.email!"Ваша почта"}</td>
        </tr>
        <tr>
            <td>Пароль</td>
            <td>
                <span class="hidden" id="passwordField">${profiles.password}</span>
                <span class="visible" onclick="togglePassword()">Показать пароль</span>
            </td>
        </tr>
    </table>
    <br>
    <hr>
    <div>
        <div id="rename_form" style="display:none;">
            <h3>Изменить пароль</h3>
            <form action="profile" method="post">
                <input type="password" name="newPassword" placeholder="Новый пароль" required>
                <button type="submit">Изменить</button>
            </form>
        </div>

        <br>
        <button id="reset-button" onclick="showChangePasswordForm()">Изменить пароль</button>
    </div>

</div>
</body>

</html>