package ensamc.mbdio.tp2_jee.controller;

import ensamc.mbdio.tp2_jee.dao.PostDAO;
import ensamc.mbdio.tp2_jee.dao.UserDAO;
import ensamc.mbdio.tp2_jee.model.Post;
import ensamc.mbdio.tp2_jee.model.User;
import ensamc.mbdio.tp2_jee.service.PostService;
import jakarta.annotation.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import javax.sql.DataSource;
import java.io.IOException;
import java.util.List;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Resource(name = "jdbc/ENSAMC-SocialNetwork")
    private static DataSource dataSource;

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
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            // read the "command" parameter
            String op = req.getParameter("operation");


            // route to the appropriate method
            if (op.equals("REGISTER")) {
                register(req, resp);
            }

        } catch (Exception exc) {
            throw new ServletException(exc);
        }
    }

    public void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // read user info from form data
            String[] names = request.getParameter("name").split(" ");
            String firstName = names[0];
            String lastName = names[1];
            String login = request.getParameter("email");
            String pass = request.getParameter("password");
            User theUser = new User(firstName, lastName, login, pass);

            // add the user to the database
            User user = userDbUtil.createUser(theUser);

            // set attribute to the request
            request.getSession().setAttribute("currentUser", user);

//            PostService.fetchFriendPosts(request,dataSource);
            response.sendRedirect(request.getContextPath() + "/home/feed.jsp");
        } catch (Exception e) {
            throw new ServletException(e);
        }

    }

    public void logout(HttpServletRequest request, HttpServletResponse response) {

    }

}
