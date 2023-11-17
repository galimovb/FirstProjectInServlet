package model;

import repository.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserRegDao {
    public String sendUserToDb(UserReg userReg) {
        String fullname = userReg.getFullName();
        String login = userReg.getLogin();
        String email = userReg.getEmail();
        String password = userReg.getPassword();
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        ResultSet resultSet = null;

        try {
            connection = DBConnection.createConnection();

            // Проверяем, существует ли пользователь с таким логином
            String checkLoginQuery = "SELECT * FROM user_data WHERE login = ?";
            preparedStatement = connection.prepareStatement(checkLoginQuery);
            preparedStatement.setString(1, login);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return "User with the same login already exists";
            }

            // Проверяем, существует ли пользователь с таким паролем
            String checkPasswordQuery = "SELECT * FROM user_data WHERE password = ?";
            preparedStatement = connection.prepareStatement(checkPasswordQuery);
            preparedStatement.setString(1, password);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                return "User with the same password already exists";
            }

            // Если ни пользователь с таким логином, ни пользователь с таким паролем не существуют, выполняем вставку
            String insertQuery = "INSERT INTO user_data (login, fullname, email, password) VALUES (?, ?, ?, ?)";
            preparedStatement = connection.prepareStatement(insertQuery);
            preparedStatement.setString(1, login);
            preparedStatement.setString(2, fullname);
            preparedStatement.setString(3, email);
            preparedStatement.setString(4, password);
            int i = preparedStatement.executeUpdate();

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
}