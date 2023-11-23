package testpackage;

import DAO.PostDao;
import model.NewPost;

import java.util.List;

public class PostTest {
    public static void main(String[] args) {
        PostDao postDao = new PostDao();
        List<NewPost> post = postDao.findAllPosts();
        for (NewPost p : post) {
            System.out.println("Post ID: " + p.getId());
            System.out.println("User Login: " + p.getUser_login());
            System.out.println("Title: " + p.getTitle());
            System.out.println("Content: " + p.getContent());
            System.out.println("Creation Date: " + p.getDateToRelease());
            System.out.println("------------------------");
        }
    }
}
