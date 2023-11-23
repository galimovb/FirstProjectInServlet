

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>

        .container {
            width: 400px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f2f2f2;
            border-radius: 5px;
        }

        .form-group {
            padding: 20px;

        }

        .form-group label {
            display: block;
            margin-bottom: 5px;
        }

        .form-group input[type="text"],
        .form-group textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        .form-group textarea {
            max-width: 360px;
            height: 100px;
        }

        .form-group button {
            padding: 10px 20px;
            background-color: #4caf50;
            color: white;
            border: none;
            border-radius: 3px;
            cursor: pointer;


        }

        .form-group button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="container">
    <h2 style="text-align: center">Create a New Comment</h2>
    <form action="newComment" method="post">
        <div class="form-group">
            <label for="comment">Comment:</label>
            <textarea id="comment" name="comment" placeholder="Enter your comment" required></textarea>
        </div>
        <div class="form-group">
            <button type="submit">Submit Comment</button>
        </div>
    </form>
</div>
</body>
</html>