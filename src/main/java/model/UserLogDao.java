package model;

import repository.DBConnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class UserLogDao {
    public String extractUserFromDb(UserLog userLog) {
        String login = userLog.getLogin();
        String password = userLog.getPassword();

        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;

        String loginInDb = "";
        String passwordInDb = "";

        try {
            con = DBConnection.createConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("select login,password from user_data");
            while (resultSet.next()) {
                loginInDb = resultSet.getString("login");
                passwordInDb = resultSet.getString("password");
                if (loginInDb.equals(login) && passwordInDb.equals(password)) {
                    return "SUCCESS";
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return "Invalid user credentials";
    }
}
