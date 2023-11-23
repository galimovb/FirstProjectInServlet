<html>
<head>
    <meta charset="UTF-8">
    <title>Комментарии</title>
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

        .comment {
            color: gray;
            margin-top: 5px;
        }

        .new-comment-form {
            margin-top: 20px;
        }
    </style>
</head>

<body>
<h2>Комментарии к посту</h2>
<div class="post">
    <div class="post-title">Title: ${postbyid.title}</div>
    <div class="post-content">Content: ${postbyid.content}</div>
</div>
<hr>
<h3>Comments:</h3>
<a href="new_comment.ftl">Создать новый комментарий</a>
<ul>
    <#list comments as comment>
        <li>
            <div>${comment.user_login!""}</div>
            <div>${comment.date!""}</div>
            <div>${comment.content!""}</div>
        </li>
        <#if comment_has_next>
            <!-- еще есть комментарии -->
        <#else>
            <#if comment?size == 0>
                <li>Еще нет комментариев</li>
            </#if>
        </#if>
    </#list>
</ul>
</body>
</html>