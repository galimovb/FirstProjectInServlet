package testpackage;

import DAO.ProfileDao;
import model.ProfileData;

public class Main {
    public static void main(String[] args) {
        /*UserLog userLog = new UserLog();
        userLog.setLogin("bulka");
        userLog.setPassword("123");
        String login=userLog.getLogin();
        String password = userLog.getPassword();
        System.out.println("Данные из формы LOGIN:" + " " + login );
        System.out.println("Данные из формы PASSWORD:" + " " + password );


        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;

        String loginInDb = "";
        String passwordInDb = "";
        try{
            con = DBConnection.createConnection();
            statement = con.createStatement();
            resultSet = statement.executeQuery("select login,password from user_data");
            while (resultSet.next()){
                loginInDb = resultSet.getString("login");
                passwordInDb=resultSet.getString("password");
                System.out.println("Данные из бд LOGIN" + " " + loginInDb );
                System.out.println("Данные из бд PASSWORD" + " " + passwordInDb );

                if(login.equals(loginInDb)&&password.equals(passwordInDb)){
                    System.out.println("Данные совпали");
                    break;
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }*/
        String userLogin = "bulka";
        ProfileDao profileDao = new ProfileDao();
        ProfileData profileData = profileDao.pullDataUsers(userLogin);
        System.out.println(profileData.getId());
        System.out.println(profileData.getLogin());
        System.out.println(profileData.getFullName());
        System.out.println(profileData.getPassword());
    }
}
