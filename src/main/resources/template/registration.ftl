<html>
<head>
    <title>Регистрация</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #fff;
        }

        .form-block {
            max-width: 400px;
            margin: 0 auto;
            margin-top: 100px;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-control::placeholder {
            opacity: 0.6;
        }
    </style>
</head>
<body>
<h3 style="text-align: center;color: red; margin-top: 40px">${error!""}</h3>
<div class="container">
    <div class="form-block">
        <form action="register" method="post">

            <h2 style="text-align: center;">Регистрация</h2>

            <div class="mb-3">
                <label for="username" class="form-label">Ваше имя:</label>
                <input type="text" id="username" name="username" required class="form-control" placeholder="Введите ваше имя">
            </div>

            <div class="mb-3">
                <label for="userlogin" class="form-label">Придумайте логин:</label>
                <input type="text" id="userlogin" name="userlogin" required class="form-control" placeholder="Придумайте логин">
            </div>

            <div class="mb-3">
                <label for="useremail" class="form-label">Почта:</label>
                <input type="text" id="useremail" name="useremail" required class="form-control" placeholder="Введите вашу почту">
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Пароль:</label>
                <input type="password" id="password" name="password" required class="form-control" placeholder="Введите пароль">
            </div>

            <input type="submit" value="Зарегистрироваться" class="btn btn-primary">
        </form>
    </div>
    <div style="text-align: center; margin-top: 20px;">
        <a href="login.ftl">Уже зарегистрированы? Войти</a>
    </div>
</div>
</body>
</html>