package ensamc.mbdio.tp2_jee.controller;

import ensamc.mbdio.tp2_jee.dao.PostDAO;
import ensamc.mbdio.tp2_jee.dao.UserDAO;
import ensamc.mbdio.tp2_jee.model.Post;
import ensamc.mbdio.tp2_jee.model.User;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.List;

@WebServlet("/home/users")
public class UserServlet extends HttpServlet {

    @Resource(name = "jdbc/ENSAMC-SocialNetwork")
    private DataSource dataSource;
    UserDAO userDAO;
    PostDAO postDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            userDAO = new UserDAO(dataSource);
            postDAO = new PostDAO(dataSource);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User currentUser = (User) req.getSession().getAttribute("user");
        int id = Integer.parseInt(req.getParameter("id"));
        if (currentUser.getId() == id) {
            resp.sendRedirect(req.getContextPath() + "/profile.jsp");
        } else {
            User person = userDAO.getUser(id);
            List<Post> posts = postDAO.getPostsByUser(person);
            req.setAttribute("person", person);
            req.setAttribute("personPosts", posts);
            req.getRequestDispatcher("/home/person-profile.jsp").forward(req, resp);
        }
    }
}
