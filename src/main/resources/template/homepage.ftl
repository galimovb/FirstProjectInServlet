<html>
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        ul {
            list-style-type: none;
            padding: 0;
        }

        li {
            margin-bottom: 20px;
            border: 1px solid #ddd;
            padding: 10px;
        }

        .post-id {
            font-weight: bold;
        }

        .user-login {
            color: blue;
        }

        .date {
            color: gray;
        }

        .title {
            font-size: 20px;
            margin-top: 10px;
        }

        .content {
            margin-top: 5px;
        }

        .new-post-link {
            margin-top: 20px;
            display: block;
            text-align: center;
            color: green;
        }
    </style>
</head>
<body>
<ul>
    <#list posts as post>
        <li>
            <div class="post-id">Post ID: ${post.id}</div>
            <div class="user-login">User Login: ${post.user_login}</div>
            <div class="date">Date to Release: ${post.dateToRelease}</div>
            <div class="title">Title: ${post.title}</div>
            <div class="content">Content: ${post.content}</div>
            <form action="commentPage" method="get">
                <input type="hidden" name="postId" value="${post.id}">
                <input type="submit" value="View Comments">
            </form>
        </li>
    </#list>
</ul>
<a href="new_post.ftl" class="new-post-link">Создать новый пост</a>
<a href="profile.ftl" class="new-post-link">Мой профиль</a>
</body>
</html>