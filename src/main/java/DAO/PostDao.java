package DAO;

import model.NewPost;
import model.UserReg;
import repository.DBConnection;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class PostDao {
    public String sendUserToDb(NewPost newPost) {
        String user_login = newPost.getUser_login();
        String title = newPost.getTitle();
        String content = newPost.getContent();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBConnection.createConnection();

            String insertQuery = "INSERT INTO post (user_login, title, content) VALUES (?, ?, ?)";
            preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setString(1, user_login);
            preparedStatement.setString(2, title);
            preparedStatement.setString(3, content);
            int i = preparedStatement.executeUpdate();

            // Если выполнение запроса прошло успешно и были вставлены новые записи в таблицу user_data,
            // то метод executeUpdate() возвращает количество измененных строк. Переменная i хранит это значение.
            if (i != 0) {
                return "SUCCESS";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Закрываем ресурсы
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                // Обработка ошибок закрытия ресурсов
                e.printStackTrace();
            }
        }

        return "Oops.. Something went wrong there..!";
    }

    public List<NewPost> findAllPosts() {
        List<NewPost> postList = new ArrayList<>();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBConnection.createConnection();

            String selectQuery = "SELECT * FROM post";
            preparedStatement = connection.prepareStatement(selectQuery);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                String postId = resultSet.getString("id");
                String userLogin = resultSet.getString("user_login");
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");
                Timestamp creationTimestamp = resultSet.getTimestamp("creation_date");

                SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS");
                SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                String creationDate = outputFormat.format(inputFormat.parse(creationTimestamp.toString()));

                NewPost post = new NewPost(postId, userLogin, creationDate, title, content);
                postList.add(post);
            }

        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        } finally {
            // Закрываем ресурсы
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                // Обработка ошибок закрытия ресурсов
                e.printStackTrace();
            }
        }

        return postList;
    }
    public NewPost findPostById(int postId) {
        NewPost post = null;
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBConnection.createConnection();

            String selectQuery = "SELECT * FROM post WHERE id = ?";
            preparedStatement = connection.prepareStatement(selectQuery);
            preparedStatement.setInt(1, postId);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                String userLogin = resultSet.getString("user_login");
                String title = resultSet.getString("title");
                String content = resultSet.getString("content");
                Timestamp creationTimestamp = resultSet.getTimestamp("creation_date");

                SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS");
                SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                String creationDate = outputFormat.format(inputFormat.parse(creationTimestamp.toString()));

                post = new NewPost(Integer.toString(postId), userLogin, creationDate, title, content);
            }

        } catch (SQLException | ParseException e) {
            e.printStackTrace();
        } finally {
            // Закрываем ресурсы
            try {
                if (resultSet != null) {
                    resultSet.close();
                }
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                // Обработка ошибок закрытия ресурсов
                e.printStackTrace();
            }
        }

        return post;
    }
}
