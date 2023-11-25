<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <link rel="stylesheet" href="src/main/resources/css/headerstyle.css">
    <style>
        body{
            position: relative;
            font-family : "Noto Sans", sans-serif;
            font-size:16px;
            line-height:1;
            color: #000;
            min-width: 320px;
            padding: 0;
            margin: 0;
        }
        .mypost_container {
            list-style-type: none;
        }

        .mypost_one {
            margin-bottom: 20px;
        }
        .post-block {
            width: 500px;
            margin: 0 auto;
            border: 1px solid #ccc;
            padding: 20px;
            text-align: center;
        }

        .post-title {
            font-size: 20px;
            font-weight: bold;
        }

        .post-id {
            float: left;
            font-size: 12px;
            color: #999;
            margin-top: 10px;
        }

        .post-date {
            float: right;
            font-size: 12px;
            color: #999;
            margin-top: 10px;
        }

        .post-content {
            border: 1px solid #ccc;
            padding: 10px 0;
            color: #555;
            margin-top: 30px;
        }

        .post-user-login {
            font-size: 14px;
            margin-top: 10px;
        }

        .view-comments {
            margin-top: 20px;
        }
        .view-comments input[type="submit"] {
            background-color: blue;
            color: white;
            border: none;

        }
        .delete-button {
            margin-top: 20px;
        }
        .delete-button input[type="submit"] {
            background-color: blue;
            color: white;
            border: none;
        }


        .new-post-link {
            margin-top: 20px;
            display: block;
            text-align: center;
            color: green;
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
            margin-left: 100px;

        }
    </style>
</head>
<body>
<div>
    <nav class = "navbar">
        <div class = "container">
            <a href = "#" class = "navbar-brand">Forum</a>

            <div class = "navbar-wrap">
                <ul class = "navbar-menu">
                    <li><a href = "profile.ftl">Мой профиль</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<ul class="mypost_container">
    <#list myposts as mypost>
        <li class = "mypost_one">
            <div class="post-block">
                <div class="post-title"> ${mypost.title}</div>
                <div class="post-id"> ${mypost.id}</div>
                <div class="post-date">${mypost.dateToRelease}</div>
                <div class="post-content">${mypost.content}</div>
                <div class="post-user-login">Автор: ${mypost.user_login}</div>
                <form action="commentPage" method="get" class="view-comments">
                    <input type="hidden" name="postId" value="${mypost.id}">
                    <input type="submit" value="Комментарии">
                </form>
                <form action="deletePost" method="post" class="delete-button">
                    <input type="hidden" name="postId" value="${mypost.id}">
                    <input type="hidden" name="author" value="${mypost.user_login}">
                    <input type="submit" value="Удалить пост">
                </form>
            </div>
        </li>
    </#list>
</ul>
<a href="new_post.ftl" class="new-post-link">Создать новый пост</a>
</body>
</html>