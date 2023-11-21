package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.UserReg;
import DAO.UserRegDao;
import java.io.IOException;


public class RegistrationServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        request.getRequestDispatcher("registration.ftl").forward(request,response);
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String fullname = request.getParameter("username");
        String login = request.getParameter("userlogin");
        String email = request.getParameter("useremail");
        String password = request.getParameter("password");

        UserReg userReg = new UserReg();
        userReg.setFullName(fullname);
        userReg.setLogin(login);
        userReg.setEmail(email);
        userReg.setPassword(password);


        UserRegDao userRegDao = new UserRegDao();
        response.setContentType("text/html");
        String userRegStatus = userRegDao.sendUserToDb(userReg);
        if(userRegStatus.equals("SUCCESS")){
            response.sendRedirect(request.getContextPath() + "/login");
        }else if(userRegStatus.equals("User with the same email already exists") || userRegStatus.equals("User with the same login already exists")){
            request.setAttribute("error", "Пользователь с таким логином или почтой существует");
            request.getRequestDispatcher("registration.ftl").forward(request,response);
        }
    }
}



