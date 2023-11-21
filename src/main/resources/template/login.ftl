
<html>
<head>
    <title>Авторизация</title>
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
<h3 style="text-align: center;color: red; margin-top: 40px">${message!""}</h3>
<div class="container">
    <div class="form-block">
        <form action="usercheck" method="post">

            <h2 style="text-align: center;">Пожалуйста, авторизуйтесь</h2>

            <div class="mb-3">
                <label for="userlogin" class="form-label">Введите логин:</label>
                <input type="text" id="userlogin" name="userlogin" required class="form-control" placeholder="Введите логин">
            </div>

            <div class="mb-3">
                <label for="password" class="form-label">Введите пароль:</label>
                <input type="password" id="password" name="password" required class="form-control" placeholder="Введите пароль">
            </div>

            <input type="submit" value="Войти" class="btn btn-primary">
        </form>
    </div>
    <div style="text-align: center; margin-top: 20px;">
        <a href="registration.ftl">Ещё не зарегистрированы? Зарегистрироваться</a>
    </div>
</div>

</body>
</html>