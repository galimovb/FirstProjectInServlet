package controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.UserLog;
import model.UserLogDao;
import repository.DBConnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class LoginServlet extends HttpServlet {
    protected void doGet (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userLogin = request.getParameter("userlogin");
        String userPassword = request.getParameter("password");

        UserLog userLog = new UserLog();
        userLog.setLogin(userLogin);
        userLog.setPassword(userPassword);

        UserLogDao userLogDao = new UserLogDao();
        String userExtractStatus = userLogDao.extractUserFromDb(userLog);
        PrintWriter writer = response.getWriter();
        response.setContentType("text/html");
        if(userExtractStatus.equals("SUCCESS")){

            writer.println("<!DOCTYPE html>");
            writer.println("<html>");
            writer.println("<head>");
            writer.println("<title>Успех</title>");
            writer.println("</head>");
            writer.println("<body>");
            writer.println("<p>Достал)))</p>");
            writer.println("</body>");
            writer.println("</html>");
        }else{
            writer.println("<!DOCTYPE html>");
            writer.println("<html>");
            writer.println("<head>");
            writer.println("<title>Успех</title>");
            writer.println("</head>");
            writer.println("<body>");
            writer.println("<p>Все плохо</p>");
            writer.println("</body>");
            writer.println("</html>");
        }
    }
}
