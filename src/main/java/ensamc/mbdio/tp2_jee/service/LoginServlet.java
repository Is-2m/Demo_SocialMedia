package ensamc.mbdio.tp2_jee.service;

import ensamc.mbdio.tp2_jee.dao.PostDAO;
import ensamc.mbdio.tp2_jee.dao.UserDAO;
import ensamc.mbdio.tp2_jee.model.Post;
import ensamc.mbdio.tp2_jee.model.User;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.List;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Resource(name = "jdbc/ENSAMC-SocialNetwork")
    private DataSource dataSource;

    private UserDAO userDbUtil;

    @Override
    public void init() throws ServletException {
        super.init();

        try {
            userDbUtil = new UserDAO(dataSource);
        } catch (Exception exc) {
            throw new ServletException(exc);
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //    check if the user is already logged in
        User currentUser = (User) req.getSession().getAttribute("currentUser");
        if (currentUser != null) {
            PostDAO postDAO = new PostDAO(dataSource);
            List<Post> posts = postDAO.getFriendPosts(currentUser);
            req.getSession().setAttribute("friendsPosts", posts);
            resp.sendRedirect("feed.jsp");
        } else {
            resp.sendRedirect("login.jsp");
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // read the "command" parameter
            String op = req.getParameter("operation");


            // route to the appropriate method
            switch (op) {

                case "LOGIN":
                    login(req, resp);
                    break;

                case "LOGOUT":
                    logout(req, resp);
                    break;
            }

        } catch (Exception exc) {
            throw new ServletException(exc);
        }
    }

    public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User user = userDbUtil.getUser(email, password);


        if (user == null) {
            response.sendRedirect("login.jsp");
            return;
        } else {
            request.getSession().setAttribute("currentUser", user);
            PostDAO postDAO = new PostDAO(dataSource);
            List<Post> posts = postDAO.getFriendPosts(user);


            request.getSession().setAttribute("friendsPosts", posts);
            response.sendRedirect("feed.jsp");
        }

    }

    public void logout(HttpServletRequest request, HttpServletResponse response) {
        try {
            request.getSession().invalidate();
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    cookie.setMaxAge(0); // Set the cookie's max age to 0 to invalidate it
                    response.addCookie(cookie);
                }
            }
            response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
            response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
            response.setDateHeader("Expires", 0); // Proxies.


            response.sendRedirect("login.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
