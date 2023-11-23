package controller;

import DAO.PostDao;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import model.NewPost;

import java.io.IOException;

public class NewPostServlet extends HttpServlet {
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);
        String userLogin = (String)session.getAttribute("userlogin");
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        NewPost newPost = new NewPost();
        newPost.setUser_login(userLogin);
        newPost.setTitle(title);
        newPost.setContent(content);
        PostDao postDao = new PostDao();
        String status = postDao.sendUserToDb(newPost);
        if(status.equals("SUCCESS")){
            response.sendRedirect(request.getContextPath()+"/homePage");
        }


    }
}
