<html>
<head>
    <meta charset="UTF-8">
    <title>Комментарии</title>
    <style>
        body {
            position: relative;
            font-family: "Noto Sans", sans-serif;
            font-size: 16px;
            line-height: 1;
            color: #000;
            min-width: 320px;
            padding: 0;
            margin: 0;
        }

        .comment-block {
            list-style-type: none;
            width: 600px;
            margin: 0 auto;
        }

        .comment-element {
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            position: relative;
        }

        .post_block {
            width: 500px;
            margin: 0 auto;
            border: 1px solid #ccc;
            padding: 20px;
            text-align: center;
            border-radius: 5px;
        }

        .post-title {
            font-size: 20px;
            font-weight: bold;
        }

        .post-content {
            border: 1px solid #ccc;
            padding: 10px 0;
            color: #555;
            margin-top: 30px;
        }

        .new-comment_link {
            display: block;
            width: fit-content;
            margin: 0 auto;
            background-color: blue;
            color: white;
            text-align: center;
            padding: 10px 20px;
            border-radius: 5px;
            text-decoration: none;
            margin-bottom: 30px;
        }

        .comment-author {
            font-weight: bold;
            position: absolute;
            top: 5px;
            left: 5px;
        }

        .comment-date {
            position: absolute;
            top: 5px;
            right: 5px;
            color: #888;
        }

        .comment-content {
            margin-top: 25px;
        }

        .no-comments {
            text-align: center;
            font-style: italic;
            margin-top: 20px;
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
</head>

<body>
<div>
    <nav class = "navbar">
        <div class = "container">
            <a href = "#" class = "navbar-brand">Forum</a>

            <div class = "navbar-wrap">
                <ul class = "navbar-menu">
                    <li><a href = "homePage">Главная страница</a></li>
                    <li><a href = "profile.ftl">Мой профиль</a></li>
                    <li><a href = "myPost">Мои посты</a></li>
                    <li><a href = "exit">Выйти</a></li>
                </ul>
            </div>
        </div>
    </nav>
</div>
<h2 style="text-align: center;margin-top: 30px">Пост: </h2>
<div class="post_block">
    <div class="post-title"> ${postbyid.title}</div>
    <div class="post-content"> ${postbyid.content}</div>
</div>
<br>
<hr>
<br>
<h3 style="text-align: center">Комментарии к этому посту:</h3>
<a class="new-comment_link" href="new_comment.ftl">Создать новый комментарий</a>
<ul class="comment-block">
    <#if comments?size == 0>
        <div class="no-comments">Еще нет комментариев</div>
    <#else>
        <#list comments as comment>
            <li class="comment-element">
                <div class="comment-author">${comment.user_login!""}</div>
                <div class="comment-date">${comment.date!""}</div>
                <div class="comment-content">${comment.content!""}</div>
            </li>
        </#list>
    </#if>
</ul>
</body>
</html>