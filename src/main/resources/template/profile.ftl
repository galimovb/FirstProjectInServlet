<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Профиль</title>
    <style>
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