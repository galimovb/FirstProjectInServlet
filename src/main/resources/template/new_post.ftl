<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Новый пост</title>
    <link rel="stylesheet" href="/miproject_war/resources/css/headerstyle.css">

</head>

<body>
<form action="createPost" method="post">
    <label for="title">Заголовок:</label>
    <input type="text" id="title" name="title" required><br>
    <label for="content">Содержание:</label>
    <textarea id="content" name="content" rows="4" cols="50" required></textarea><br>
    <input type="submit" value="Создать пост">
</form>
</body>

</html>