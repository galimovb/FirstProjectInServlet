package repository;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {

    public static Connection createConnection(){
        Connection connection = null;
            String url = "jdbc:postgresql://localhost:5433/project_db";
            String username = "postgres";
            String password = "123456";
            System.out.println("In DBConnection.java class ");

            try
            {
                try
                {
                    Class.forName("org.postgresql.Driver");
                }
                catch (ClassNotFoundException e)
                {
                    e.printStackTrace();
                }
                connection = DriverManager.getConnection(url, username, password); //attempting to connect to MySQL database
                System.out.println("Printing connection object "+connection);
            }
            catch (Exception e)
            {
                e.printStackTrace();
            }
            return connection;

    }
}
