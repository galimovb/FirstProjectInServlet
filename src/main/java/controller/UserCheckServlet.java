package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import DAO.ProfileDao;
import model.ProfileData;
import model.UserLog;
import DAO.UserLogDao;

import java.io.IOException;

public class UserCheckServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userLogin = request.getParameter("userlogin");
        String userPassword = request.getParameter("password");

        UserLog userLog = new UserLog();
        userLog.setLogin(userLogin);
        userLog.setPassword(userPassword);

        UserLogDao userLogDao = new UserLogDao();
        String userExtractStatus = userLogDao.extractUserFromDb(userLog);
        response.setContentType("text/html");
        if(userExtractStatus.equals("SUCCESS")){

            HttpSession session = request.getSession();
            session.setAttribute("userlogin",userLog.getLogin());
            session.setAttribute("password",userLog.getPassword());

            ProfileDao profileDao = new ProfileDao();
            ProfileData profileData = profileDao.pullDataUsers(userLogin);
            session.setAttribute("profiles",profileData);

            response.sendRedirect(request.getContextPath()+ "/homePage");
        }else if(userExtractStatus.equals("НЕПРАВИЛЬНЫЙ ПАРОЛЬ")){
            request.setAttribute("message", "Неправильный пароль");
            request.getRequestDispatcher("login.ftl").forward(request, response);
        }else{
            request.setAttribute("message", "Похоже,такого пользователя не существует");
            request.getRequestDispatcher("login.ftl").forward(request, response);
        }
    }
}
